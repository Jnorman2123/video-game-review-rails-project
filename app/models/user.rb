class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveModel::Naming
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :reviews 
  has_many :games, through: :reviews
  scope :is_admin, -> { where(admin: true)}
  scope :not_admin, -> { where(admin: false)}

  def self.from_omniauth(auth) 
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user| 
      user.provider = auth.provider 
      user.username = auth.info.name
      user.uid = auth.uid 
      user.email = auth.info.email 
      user.password = Devise.friendly_token[0,20]
    end
  end 

  def self.user_admins 
    self.all.is_admin
  end 

  def self.user_non_admins
    self.all.not_admin
  end 

end
