class TopicsController < ApplicationController
  require "#{Rails.root}/lib/paginate.rb"

  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(page: params[:page], per_page: 2)
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(topics_params)
    authorize @topic

    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again"
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.update_attributes(topics_params)
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Please try again"
      render :edit
    end

  end
end

private

def topics_params
  params.require(:topic).permit(:name, :description, :public)
end