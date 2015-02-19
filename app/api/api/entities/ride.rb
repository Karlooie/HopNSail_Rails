module API
  module Entities
    class Ride < Grape::Entity
      expose :id,             documentation: { type: 'Integer',   desc: 'Id' }
      expose :ride_type,      documentation: { type: 'String',    desc: 'Ride Type' }
      expose :availability,   documentation: { type: 'String',    desc: 'availability' }
      expose :state,          documentation: { type: 'String',    desc: 'State' }
      expose :description,    documentation: { type: 'text',      desc: 'Description' }
      expose :starting_at,    documentation: { type: 'Datetime',  desc: 'Starting At' }
      expose :duration,       documentation: { type: 'Integer',   desc: 'Duration' }

      # expose :user,         using: API::Entities::User, as: :user
      # expose :boat,         using: API::Entities::Boat, as: :user
    end
  end
end