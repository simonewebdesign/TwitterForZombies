class TweetsController < ApplicationController
  
  before_filter :get_zombie, except: :latest
  
  def get_zombie
    @zombie = Zombie.find(params[:zombie_id])
  end

  # GET
  def index
    @tweets = @zombie.tweets

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweets }
    end
  end

  # GET
  def show
    @tweet = @zombie.tweets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET
  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET
  def edit
    @tweet = @zombie.tweets.find(params[:id])
    
    session[:zombie_id] = 10 # i'm duke!!!1 :D
    
    if session[:zombie_id] != @tweet.zombie_id
      flash[:error] = "Sorry, you can't edit this tweet."
      redirect_to(zombie_tweets_path)
    end
  end

  # POST
  def create
    @tweet = @zombie.tweets.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully created.' }
        format.json { render json: [@zombie, @tweet], status: :created, location: [@zombie, @tweet] }
      else
        format.html { render action: "new" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT
  def update
    @tweet = @zombie.tweets.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE
  def destroy
    @tweet = @zombie.tweets.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to zombie_tweets_url }
      format.json { head :no_content }
    end
  end
  
  # GET
  def latest
    @tweets = Tweet.latest

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweets }
    end
  end
  
end
