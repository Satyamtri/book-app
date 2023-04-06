class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2]
  
  # validates :contactnumber, length: { minimum: 10}
  # validates :name, presence: true
  # validates :email, confirmation: true
  # validates :password, length: { in: 5..20 }
  
  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first
    unless user
      user = User.create(
        email: access_token.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
    # user.name = access_token.info.name
    # user.image = access_token.info.image
    # user.uid = access_token.uid
    # user.provider = access_token.provider
    # user.save
    
    user
  end
  has_many :books
  has_many :orders
  has_many :addresses, dependent: :destroy
  # has_one :address
  has_one_attached :avatar
  
  after_commit :add_default_avatar, on: %i[create update]
  
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      "/default_profile.jpg"
    end 
  end
  
  private
  
  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_profile.jpg'
          )
        ), 
        filename: 'default_profile.jpg',
        content_type: 'image/jpg'
      )
    end 
  end
 
  
  # scope :admin?, -> { where(admin: true) }
  # def username
  #   return self.email.split('@')[0].capitalize
  # end       
end
