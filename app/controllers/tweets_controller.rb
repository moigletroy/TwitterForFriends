class TweetsController < ApplicationController

  before_filter :authenticate_friend!

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.order("created_at desc").page(params[:page]).per(45)
    @tweet = Tweet.new
    @friends = Friend.online_friends
    @photos = Photo.recent_photos
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweets }
      format.js { render :layout => false} # index.js.erb
    end
  end

  def stream    
    @tweets = Tweet.order("created_at desc").where('id > ?', params[:after].to_i) if params[:after]
     respond_to do |format|
       format.js { render :layout => false} # stream.js.erb
     end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.json
  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(params[:tweet])
    if @tweet.message.blank?
      redirect_to tweets_url, :notice => "Please enter a message" 
      return
    end
    @tweet.friend = current_friend
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_url, notice: 'Tweet was successfully created.' }
        format.json { render json: @tweet, status: :created, location: @tweet }
      else
        format.html { render action: "new" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tweets/1
  # PUT /tweets/1.json
  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end
  end
end
