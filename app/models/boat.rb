class Boat < ActiveRecord::Base

  belongs_to  :user
  has_many    :rides, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates :name,
            :user_id,
            :boat_type,
            :avatar, presence: true

end