require 'grape-swagger'

module API
  class Base < Grape::API

    include Grape::Kaminari
    
    prefix 'api'

    rescue_from :all, :backtrace => true
    
    error_formatter :json, API::ErrorFormatter

    # logging features
    before do
      @start = Time.now.to_f
    end

    after do
      duration = (Time.now.to_f - @start) * 1000
      logger = Rails.configuration.logger

      logger ||= Rails.logger
      logger.info({
        short_message: "[#{status}] #{request.request_method} #{request.path}",
        code: status,
        ip: request.ip,
        user_agent: request.user_agent,
        params: request.params.except('route_info').to_hash,
        duration: duration.to_i
        # session: request.session.except('session_id', '_csrf_token').to_hash
      })
    end

  # ...
    

    # Rescue from errors
    rescue_from ActiveRecord::RecordNotFound do |e|
      error_response(message: [e.message], status: 404)
    end

    rescue_from :all do |e|
      error_response({ message: ["Error: (#{e.class.name}) - #{e.message}"]})
    end

    helpers do
      def warden
        env['warden']
      end

      def authenticate_user!
        error!(["401 Unauthorized"], 401) unless authenticated
      end

      def authenticated
        return true if warden.authenticated?
        params[:access_token] && @user = User.find_by_authentication_token(params[:access_token])
      end

      def current_user
        warden.user || @user
      end
  end



    
    mount API::V1::Base

    add_swagger_documentation api_version: 'v1',
                              hide_documentation_path: true,
                              info: { title: 'Hop n Sail Api Docs' }

  end
end