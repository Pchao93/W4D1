class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    # render json: params
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 200
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user, status: 200
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user
      @user.update(user_params)
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end


end
