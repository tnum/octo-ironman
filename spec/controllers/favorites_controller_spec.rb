require 'rails_helper'
 
 describe FavouritesController do
 
   include TestFactories
   include Devise::TestHelpers
 
   before do 
     @post = associated_post
     @user = authenticated_user
     sign_in @user
   end
 
   describe '#create' do
     it "creates a favourite for the current user and specified post" do
       expect( @user.favourited.find_by_post_id(@post.id) ).to eq(nil)
 
       post :create, { post_id: @post.id }
 
       expect( @user.favourite.find_by_post_id(@post.id).class ).to eq(Favourite)
     end
   end
 
   describe '#destroy' do
     it "destroys the favourite for the current user and post" do
       favourite = @user.favourite.where(post: @post).create
       expect( @user.favourited.find_by_post_id(@post.id).class ).to eq(Favourite)
 
       delete :destroy, { post_id: @post.id, id: favourite.id }
 
       expect( @user.favourite.find_by_post_id(@post.id) ).to eq(nil)
     end
   end
 end