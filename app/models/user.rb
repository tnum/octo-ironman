class User < ActiveRecord::Base

  # associations
  has_many :posts

  # validations

  # plugins

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # everything else
  def role?(base_role)
    role == base_role.to_s
  end
end
