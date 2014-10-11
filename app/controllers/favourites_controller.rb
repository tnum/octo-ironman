class FavouritesController < ApplicationController

  before_action :load_post_and_topic

  def create
    favourite = current_user.favourites.build(post: @post)

    authorize favourite

    if favourite.save
      # Add code to generate a success flash and redirect to @post
      # Remember the path shortcut: [@post.topic, @post]
      flash[:notice] = "Post favorited"
      redirect_to [@post.topic, @post]
     else
       # Add code to generate a failure flash and redirect to @post
       flash[:error] = "Please try again."
       redirect_to [@post.topic, @post]
     end
  end

  def destroy
    # Get the post from the params
    # Find the current user's favorite with the ID in the params
    favourite = current_user.favourites.find(params[:id])

    authorize favourite
 
    if favourite.destroy
      # Flash success and redirect to @post
      flash[:notice] = "Post unfavorited"
      redirect_to [@post.topic, @post]
      else
      # Flash error and redirect to @post
      flash[:error] = "Please try again."
       redirect_to [@post.topic, @post]
    end
 end

  private

  def load_post_and_topic
    @post = Post.find(params[:post_id])
  end
  
end
