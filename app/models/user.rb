class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  # :confirmable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         # :omniauthable, :omniauth_providers => [:facebook]

  mount_uploader :avatar, AvatarUploader

  has_many :boats, dependent: :destroy
  has_many :rides # rides are dependent destoy on boats
  has_many :submissions # submissions are depentent destroy on rides

  has_many :reviews, as: :reviewable, dependent: :destroy           # reviews that I received
  has_many :user_review, dependent: :destroy, class_name: 'Review'  # reviews I did

  before_save :ensure_authentication_token
  
  def approved_rides
    ride_ids = self.submissions.approved.pluck(:ride_id)
    return Ride.where('id in (?)', ride_ids)
  end

  def submitted_rides
    ride_ids = self.submissions.pluck(:ride_id)
    return Ride.where('id in (?)', ride_ids)
  end


  ############
  # API AUTH #
  ############

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
  
  

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where( provider: auth.provider, uid: auth.uid).first
    if !user
      registered_user = User.where( email: auth.info.email).first
      if registered_user
        user = registered_user
      else
        user = User.create(username:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
      end    
    end
    # uncomment for add facebook friends
    # add_fb_friends(user, auth);
    return user
  end


end
