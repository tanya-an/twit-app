class TwittsController < ApplicationController
  before_action :require_login
  before_action :set_twitt, only: [:show, :edit, :update, :destroy]

  def index
    twitts_list
    @twitt = Twitt.new
  end

  def create
  	@twitt = Twitt.create(user_id: current_user.id, 
                          body: twitts_params[:body], 
                          image: twitts_params[:image])
    if @twitt.save
      redirect_to root_path
      flash[:notice] = 'Tweet was successfully created'
    else
      redirect_to root_path
      flash[:error] = 'Oooops'
    end
  end

  private 

  def require_login
    redirect_to home_index_path if current_user.nil?
  end

  def twitts_params
    params.require(:twitt).permit(:body, :image, :image_cache)
  end
  
  def user
    @user ||= current_user
  end

  def twitts_list
    @twitts = Twitt.where(user_id: user.id).order('updated_at DESC')
  end

end
