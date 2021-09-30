class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :dogs, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_dogs, through: :likes, source: :dog
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  mount_uploader :image, ImageUploader
  
  def already_liked?(dog)
    self.likes.exists?(dog_id: dog.id)
  end
end
