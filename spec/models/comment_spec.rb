require 'rails_helper'
 
  describe Comment do
 
  describe "after_create" do
 
    before do
      @post = create(:post)
      @user = create(:user)
      @comment = Comment.new(body: 'My comment', post: @post, user_id: 10000)
    end

    # We don't need to change anything for this condition;
    # The email_favorites attribute defaults to true
    context "with user's permission" do
 
      it "sends an email to users who have favorited the post" do
        @user.favourites.where(post: @post).create 
   
        allow( FavouriteMailer )
          .to receive(:new_comment)
          .with(@user, @post, @comment)
          .and_return( double(deliver: true) )
   
        @comment.save

      end
   
      it "does not send emails to users who haven't" do
        expect( FavouriteMailer )
        .not_to receive(:new_comment)
   
        @comment.save
      end

    end

    context "without permission" do
 
      before { @user.update_attribute(:email_favorites, false) }
 
      it "does not send emails, even to users who have favorited" do
        @user.favourites.where(post: @post).create
 
        expect( FavouriteMailer )
          .not_to receive(:new_comment)
         
        @comment.save
      end
    end
  end
end