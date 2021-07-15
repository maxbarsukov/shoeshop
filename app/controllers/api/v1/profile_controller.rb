module Api
  module V1
    class ProfileController < Api::V1::BaseApiController
      def index
        respond_with current_resource_owner
      end
    end
  end
end
