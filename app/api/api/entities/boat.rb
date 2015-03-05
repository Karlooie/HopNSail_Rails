module API
  module Entities
    class Boat < Grape::Entity
      expose :id,           documentation: { type: 'Integer',  desc: 'Id' }
      expose :name,         documentation: { type: 'String',   desc: 'Name' }
      expose :avatar,       documentation: { type: 'File',     desc: 'Avatar' }
      expose :boat_type,    documentation: { type: 'String',   desc: 'Boat Type' }
      expose :make,         documentation: { type: 'String',   desc: 'Make' }
      expose :model,        documentation: { type: 'Decimal',  desc: 'Model' }
      expose :year,         documentation: { type: 'Integer',  desc: 'Year' }
      expose :lenght,       documentation: { type: 'Decimal',  desc: 'Lenght' }
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