class ArtworkSharesController < ApplicationController
  def create
    new_share = ArtworkShare.new(shares_params)
    if new_share.save
      render json: new_share
    else
      render json: new_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    share_to_delete = share
    if share
      share.destroy
      render json: share_to_delete
    else
      render plain: "Invalid artwork share id", status: :unprocessable_entity
    end
  end

  private

  def share
    ArtworkShare.find_by_id(params[:id])
  end

  def shares_params
    params.require(:artwork_share).permit(:viewer_id, :artwork_id)
  end
end