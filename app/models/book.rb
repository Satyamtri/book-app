class Book < ApplicationRecord
  # validates :bname, :price, presence: true

  belongs_to :user
  belongs_to :category
  has_one_attached :avatar
  has_many :lineitems, dependent: :destroy

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "170x170!" ).processed
    else
      "/default_profile.jpg"
    end 
  end

  
end
