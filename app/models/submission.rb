class Submission < ActiveRecord::Base


  belongs_to :user
  belongs_to :ride

  validates :ride, uniqueness: { scope: :user, message: "should apply just once per ride" }

  # Available scopes
  scope :pending,          -> { where(state: 'pending') }
  scope :approved,         -> { where(state: 'approved') }
  scope :rejected,         -> { where(state: 'rejected') }
  
  # States
  state_machine :state, :initial => :pending do

    event :approve do
      transition all => :approved
    end  

    event :reject do
      transition all => :rejected
    end
  end



end