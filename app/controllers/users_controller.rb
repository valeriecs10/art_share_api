class UsersController < ApplicationController
  def index
    render json: User.all 
  end

  def show
    if user
      render json: user
    else
      render plain: "Invalid user id", status: :unprocessable_entity
    end
  end

  def update
    if user
      User.update(params[:id], user_data)
      render json: user
    else
      render plain: "Invalid user id", status: :unprocessable_entity
    end
  end

  def create
    if user.save
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

  def user
    User.find_by_id(params[:id])
  end

  def user_data
    params.require(:user).permit(:name, :email)
  end
end