module API::V1
  class Base < API::Base
    
    version 'v1', using: :header, vendor: 'hopnsail'
    
    format :json
    
    mount API::V1::Sessions
    mount API::V1::Rides
    mount API::V1::Profile
  end
end
