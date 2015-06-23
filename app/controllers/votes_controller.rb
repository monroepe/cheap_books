class VotesController < ApplicationController
  def create
    binding.pry
    @article = Article.find(params[:article_id])
    @vote = @article.votes.new(vote_params)
    @vote.user = current_user

    if @vote.save
      redirect_to articles_path
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end
end
