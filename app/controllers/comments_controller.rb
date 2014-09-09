class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build(comments_params)
    @comment.post = @post
    @new_comment = Comment.new

    if @comment.save
      flash[:notice] = "Comment was saved"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error, please try again"
      render :new
    end
  end
end
