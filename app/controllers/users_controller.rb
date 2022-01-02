class UsersController < ApplicationController
  skip_before_action :require_sign_in!#, only: [:new, :create]
  before_action :authenticate_with_http_basic
  before_action :ensure_correct_user, only: [:show]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    # if @user.save
    #   redirect_to root_path
    else
      render :new
    end
  end
  
  def index
    @users = User.all
    @score = Score.new
  end
  
  def show
    @user=User.find(params[:id])
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
  private
  
  def set_user
    @user=User.find(params[:id])
  end
  
  
  def user_params
    params.require(:user).permit(:name, :mail, :password, :password_confirmation)
  end
  
end
