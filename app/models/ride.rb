class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :boat

  validates :user_id,
            :boat_id,
            :ride_type,
            :availability,
            :starting_at, presence: true


  def ride_type_to_s
    I18n.t self.ride_type, scope: [:simple_form, :options, :ride, :ride_type]
  end

  
end