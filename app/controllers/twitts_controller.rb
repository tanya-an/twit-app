class TwittsController < ApplicationController
	before_action :set_twitt, only: [:show, :edit, :update, :destroy]

  def index
  	@twitts = Twitt.all
  	#respond_with(@twitts)
    @twitt = Twitt.new

  end

  def show
    respond_with(@twitt)
  end

  def new
  	@twitt = Twitt.new
  	#respond_with(@twitt)
  end

  def create
  	@twitt = Twitt.create(user_id: current_user.id, body: params[:twitt][:body])
    redirect_to twitts_path, notice: 'Tweet was successfully created.'
  end

  def update
  	@twitt.update(twitt_params)
  	respond_with(@twitt)
  end
end
