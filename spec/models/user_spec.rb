require 'rails_helper'
 
describe User do
 
  include TestFactories

  before do
    @post = associated_post
    @user = authenticated_user
  end
 
  describe "#favourited(post)" do
    it "returns `nil` if the user has not favorited the post" do
      expect (@user.favourite.where(post: @post)).to eq(nil)
    end
 
    it "returns the appropriate favorite if it exists" do
    end
  end
end