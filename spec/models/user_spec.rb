require 'rails_helper'
 
describe User do
 
  include TestFactories

  before do
    @post = associated_post
    @user1 = authenticated_user
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
end