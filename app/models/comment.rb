class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :user, presence: true

  after_create :send_favourite_emails
 
  private
 
  def send_favourite_emails
    post.favourites.each do |favourite|
      FavouriteMailer.new_comment(favourite.user, post, self).deliver
    end
  end


end
