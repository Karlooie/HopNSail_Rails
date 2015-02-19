module API::V1
  class Profile < API::V1::Base
    
    resource :profile do

      desc "Returns the profile of the currently signed in user", entity: API::Entities::User
      params do
        requires :access_token, type: String, desc: 'Access Token'
      end
      get do
        authenticate_user!
        present current_user, with: API::Entities::User, type: :token_required
      end
      
      desc "Create a new user profile", entity: API::Entities::User
      params do
        optional :user, type: Hash do
          optional :username,   type: String, desc: 'Username'
          requires :first_name, type: String, desc: 'First Name'
          requires :last_name,  type: String, desc: 'Last Name'
          requires :email,      type: String, desc: 'Email'
          requires :password,   type: String, desc: 'Password'
          optional :bio,        type: String, desc: 'Bio'
          optional :avatar,     type: Hash,   desc: 'Avatar'
        end
      end
      post do
        @user = User.build params[:user]
        if @user.save
          present @user, with: API::Entities::User, type: :token_required
        else
          error!(@user.errors.full_messages, 422)
        end
      end

      desc "Updates the currently logged in users profile", entity: API::Entities::User
      params do
        requires :access_token, type: String, desc: 'Access Token'
        optional :user, type: Hash do
          optional :username,  type: String, desc: 'Username'
          optional :first_name, type: String, desc: 'First Name'
          optional :last_name,  type: String, desc: 'Last Name'
          optional :email,     type: String, desc: 'Email'
          optional :password,  type: String, desc: 'Password'
          optional :bio,       type: String, desc: 'Bio'
          optional :avatar,    type: Hash,   desc: 'Avatar'
        end
      end
      put do
        authenticate_user!
        
        if current_user.update_attributes params[:user]
          present current_user, with: API::Entities::User, type: :token_required
        else
          error!(current_user.errors.full_messages, 422)
        end

      end      

    end

  end

end