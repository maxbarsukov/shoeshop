class Rack::Attack
  # By default, Rack::Attack uses `Rails.cache` to store requests information.
  # It's configurable as follows -
  #
  # redis_client = Redis.connect(url: ENV["REDIS_URL"])
  # Rack::Attack.cache.store = Rack::Attack::StoreProxy::RedisStoreProxy.new(redis_client)

  class Request < ::Rack::Request

    # You many need to specify a method to fetch the correct remote IP address
    # if the web server is behind a load balancer.
    def remote_ip
      @remote_ip ||= (env['HTTP_CF_CONNECTING_IP'] || env['action_dispatch.remote_ip'] || ip).to_s
    end

    def allowed_ip?
      allowed_ips = %w[127.0.0.1 ::1]
      allowed_ips.include?(remote_ip)
    end
  end

  # Throttle all requests to root path by IP (40rpm/IP)
  throttle("req/ip", limit: 40, period: 1.minute) do |req|
    req.remote_ip
  end

  # Do not throttle for allowed IPs
  safelist('allow from localhost') do |req|
    req.allowed_ip?
  end
end

# Log blocked events
ActiveSupport::Notifications.subscribe('rack.attack') do |name, start, finish, request_id, payload|
  req = payload[:request]
  if req.env["rack.attack.match_type"] == :throttle
    request_headers = { "CF-RAY" => req.env["HTTP_CF_RAY"], "X-Amzn-Trace-Id" => req.env["HTTP_X_AMZN_TRACE_ID"] }
    Rails.logger.info "[Rack::Attack][Blocked] remote_ip: \"#{req.remote_ip}\", path: \"#{req.path}\", headers: #{request_headers.inspect}"
  end
end
