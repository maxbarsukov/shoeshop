class Api::V1::ProfileController < Api::V1::BaseApiController
  def index
    respond_with current_resource_owner
  end
end
