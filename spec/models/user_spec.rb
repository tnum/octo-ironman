require 'rails_helper'
 
describe User do

  before do
    @post = create(:post)
    @user1 = create(:user)
  end
 
  describe "#favourited(post)" do
    it "returns `nil` if the user has not favorited the post" do
      expect(@user1.favourited(@post)).to eq(nil)
    end
 
    it "returns the appropriate favorite if it exists" do
       favourite = @user1.favourites.where(post: @post).create 
 
       expect( @user1.favourites.find_by_post_id(@post.id).class ).to eq(Favourite)
    end
  end

  describe ".top_rated" do
 
    before do
      @user1 = create(:user)
      post = create(:post, user: @user1)
      create(:comment, user: @user1, post: post)
 
      @user2 = create(:user)
      post = create(:post, user: @user2)
      2.times { create(:comment, user: @user2, post: post) }
    end
 
    it "returns users ordered by comments + posts" do
      expect( User.top_rated ).to eq([@user2, @user1])
    end
 
    it "stores a `posts_count` on user" do
      users = User.top_rated
      expect( users.first.posts_count ).to eq(1)
    end
 
    it "stores a `comments_count` on user" do
      users = User.top_rated
      expect( users.first.comments_count ).to eq(2)
    end
  end
end