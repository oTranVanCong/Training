module Api
  class BaseController < ApplicationController
    API_STATUS               = { success: 1, failure: 0 }
    DEFAULT_SUCCESS_RESPONSE = { code: API_STATUS[:success], status: :success }
    DEFAULT_FAILURE_RESPONSE = { code: API_STATUS[:failure], status: :failure }

    rescue_from Exception do |exception|
      render json: DEFAULT_FAILURE_RESPONSE.merge({ message: exception.to_s })
    end
  end
end