class UsersController < ApplicationController
  def index
    if params.has_key?(:username)
      render json: User.where("username LIKE '%#{params[:username]}%'")
    else
      render json: User.all 
    end
  end

  def show
    if user
      render json: user
    else
      render plain: "Invalid user id", status: :unprocessable_entity
    end
  end
  
  def create
    new_user = User.new(user_params)
    if new_user.save
      render json: new_user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if user
      User.update(params[:id], user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user_to_delete = user
    if user
      user.destroy
      render json: user_to_delete
    else
      render plain: "Invalid user id", status: :unprocessable_entity
    end
  end

  private
  
  def user
    User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end
end