class User < ActiveRecord::Base

  # associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favourites, dependent: :destroy

  # validations

  # plugins

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # everything else
  def role?(base_role)
    role == base_role.to_s
  end

  def favourited(post)
    favourites.where(post_id: post.id).first
  end

end
