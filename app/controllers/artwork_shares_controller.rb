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

  def favorite
    share_to_favorite = ArtworkShare.find_by_id(params[:artwork_share_id])
    if share_to_favorite
      share_to_favorite.update(favorite: true)
      render json: share_to_favorite
    else
      render plain: "Invalid artwork id", status: :unprocessable_entity
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