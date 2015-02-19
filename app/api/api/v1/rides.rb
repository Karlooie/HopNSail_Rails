module API::V1
  class Rides < API::V1::Base

    resource :rides do
      before { authenticate_user! }

      paginate per_page: 20, max_per_page: 30

      desc "Returns a list of all rides viewable to the user", entity: API::Entities::Ride
      params do
        requires :access_token, type: String, desc: 'Access Token'
        optional :page, type: String, desc: 'Page Number'
      end

      ### GET LIST ###
      get do
        present paginate(Ride.all.order(created_at: :asc)), with: API::Entities::Ride, current_user: current_user
      end

    end

  end
end

