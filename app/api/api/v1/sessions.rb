module API::V1
  class Sessions < API::V1::Base

    resource :sessions do
      
      helpers do
        def user
          @user ||= User.where(:email => params[:email]).first
        end
      end

      desc "Authenticates a user", entity: API::Entities::User
      params do
        requires :email, type: String, desc: 'Email'
        requires :password, type: String, desc: 'Password'
      end
      post do
        if user.present? && user.valid_password?(params[:password])
          user.reset_authentication_token!
          present user, with: API::Entities::User, type: :token_required
        else
          error!(["401 Invalid Login"], 401)
        end        
      end

    end

  end
end
