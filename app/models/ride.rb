class Ride < ActiveRecord::Base

  belongs_to  :user
  belongs_to  :boat
  has_many    :submissions

  validates :user_id,
            :boat_id,
            :ride_type,
            :availability,
            :starting_at, presence: true


  def ride_type_to_s
    I18n.t self.ride_type, scope: [:simple_form, :options, :ride, :ride_type]
  end

  # Available scopes
  scope :open,        -> { where(state: 'open') }
  scope :completed,   -> { where(state: 'completed') }
  scope :cancelled,   -> { where(state: 'cancelled') }
  
  # States
  state_machine :state, :initial => :open do

    event :complete do
      transition all => :completed
    end  

    event :cancel do
      transition all => :cancelled
    end
  end


end