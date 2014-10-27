class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
    @genres = Genre.all
  end

  def create
    @topic = current_user.topics.build(topic_params)
    @genres = Genre.all

    if @topic.save
      redirect_to topics_path, notice: "Topic created successfully!"
    else
      render "new"
    end
  end

  def edit
    @topic = current_user.topics.find(params[:id])
    @genres = Genre.all
  end

  def update
    @topic = current_user.topics.find(params[:id])
    @genres = Genre.all

    if @topic.update(topic_params)
      redirect_to topics_path, notice: "Topic updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @topic = current_user.topics.find(params[:id])
    @topic.destroy
    redirect_to topics_path, notice: "Topic deleted successfully"
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :genre_id)
  end
end
