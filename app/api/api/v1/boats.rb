module API::V1
  class Boats < API::V1::Base

    resource :boats do
      before { authenticate_user! }

      ###
      ### POST 
      ###
      desc "Create a new boat", entity: API::Entities::Boat
      params do
        optional :access_token, type: String, desc: 'Access Token'
        optional :boat,  type: Hash do
          optional :name,      type: String,  desc: 'Name'
          optional :boat_type, type: String,  desc: 'Boat Type'
          optional :make,      type: String,  desc: 'Make'
          optional :model,     type: String,  desc: 'Model'
          optional :year,      type: Integer, desc: 'Year'
          optional :lenght,    type: Float,   desc: 'Lenght'
          optional :avatar,     type: Hash do 
            optional :base64_image, type: String, desc: "Image Base64"
            optional :filename,     type: String, desc: "Image Filename"
          end

        end
      end

      post do
        # decode avatar as image before saving
        if params[:boat][:avatar].present? and params[:boat][:avatar].is_a?(Hash)
          decoder = Decoder::Image.new(params[:boat][:avatar])
          params[:boat][:avatar] = Decoder::Image.decode
        end

        @boat = current_user.boats.create(params[:boat])
        if @boat.valid?
          present @boat, with: API::Entities::Boat, current_user: current_user
        else
          error!(@boat.errors.full_messages, 422)
        end
      end
      
      ###
      ### PUT 
      ###
      desc "Update a boat", entity: API::Entities::Boat
      params do
        requires :access_token, type: String, desc: 'Access Token'
        optional :boat,  type: Hash do
          requires :id,        type: Integer, desc: 'Id'
          optional :name,      type: String,  desc: 'Name'
          optional :boat_type, type: String,  desc: 'Boat Type'
          optional :make,      type: String,  desc: 'Make'
          optional :model,     type: String,  desc: 'Model'
          optional :year,      type: Integer, desc: 'Year'
          optional :lenght,    type: Float,   desc: 'Lenght'
          optional :avatar,     type: Hash do 
            optional :base64_image, type: String, desc: "Image Base64"
            optional :filename,     type: String, desc: "Image Filename"
          end
        end
      end

      put do
        # decode avatar as image before saving
        if params[:boat][:avatar].present? and params[:boat][:avatar].is_a?(Hash)
          decoder = Decoder::Image.new(params[:boat][:avatar])
          params[:boat][:avatar] = Decoder::Image.decode
        end

        @boat = current_user.boats.find params[:boat][:id]
        @boat.update_attributes params[:boat]
        if @boat.save
          present @boat, with: API::Entities::Boat, current_user: current_user
        else
          error!(@boat.errors.full_messages, 422)
        end
      end








    end

  end
end