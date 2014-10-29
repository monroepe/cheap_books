class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to topic_path(@topic), notice: "Post created successfully!"
    else
      render "new"
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to topic_path(@topic), notice: "Post updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    @post.destroy
    redirect_to topic_path(@topic), notice: "Post deleted successfully"
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
