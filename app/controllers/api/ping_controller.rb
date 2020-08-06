class Api::PingController < ApplicationController

  def index
    render json: success
    # require "pry"; binding.pry
  end

private

    def success
      response.status = 200
      response.body = { "success": true }
    end
end
