module API
  module Entities
    class Boat < Grape::Entity
      expose :id,             documentation: { type: 'Integer',   desc: 'Id' }
      expose :ride_type,      documentation: { type: 'String',    desc: 'Ride Type' }
      expose :availability,   documentation: { type: 'String',    desc: 'availability' }
      expose :state,          documentation: { type: 'String',    desc: 'State' }
      expose :description,    documentation: { type: 'text',      desc: 'Description' }
      expose :starting_at,    documentation: { type: 'Datetime',  desc: 'Starting At' }
      expose :duration,       documentation: { type: 'Integer',   desc: 'Duration' }
      expose :avatar,         documentation: { type: 'File',      desc: 'Avatar' }
    end
  end
end



    # t.string   "name"
    # t.string   "avatar"
    # t.string   "boat_type"
    # t.string   "make"
    # t.string   "model"
    # t.integer  "year"
    # t.decimal  "lenght"