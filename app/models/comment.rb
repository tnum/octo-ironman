class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :user, presence: true

  after_create :send_favourite_emails
 
  private
 
  def send_favourite_emails
    post.favourites.each do |favourite|
      if should_receive_update_for?(favourite)
        FavoriteMailer.new_comment(favourite.user, self.post, self).deliver
      end
    end
  end

  def should_receive_update_for?(favourite)
    user_id != favourite.user_id && favourite.user.email_favourites?
  end

end
