class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_device
  def check_device
    @device_type = DeviceDetector.new(request.user_agent).device_type
  end
end
