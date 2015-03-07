module API
  module Entities
    class User < Grape::Entity
      expose :id,         documentation: { type: 'Integer', desc: 'Id' }
      expose :username,   documentation: { type: 'String', desc: 'Username' }
      expose :first_name, documentation: { type: 'String', desc: 'First Name' }
      expose :last_name,  documentation: { type: 'String', desc: 'Last Name' }
      expose :email,      documentation: { type: 'String', desc: 'Email' }

      expose :avatar,     documentation: { type: 'Hash', desc: 'Avatar' }
      expose :bio,        documentation: { type: 'Text', desc: 'Bio' }

      # expose :likes_count, documentation: { type: 'Integer', desc: 'number of likes' }

      # Required when token_required specified as type
      expose :authentication_token, documentation: { type: 'String', desc: 'Users Access Token' }, if: { type: :token_required }

      private 

      # def likes_count
      #   object.likes.count
      # end
    end
  end
end