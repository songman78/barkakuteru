class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create 
    if Tweet.create(tweet_params)
      redirect_to root_path
    else
      redirect_to new_tweet_path
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
  tweet.destroy
  redirect_to root_path
  end


  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to tweet_path
  end


  def show
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name,:base, :drink, :image, :text)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
