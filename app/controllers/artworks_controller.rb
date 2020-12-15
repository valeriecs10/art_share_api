class ArtworksController < ApplicationController
  def index
    user = User.find_by_id(params[:user_id])
    if user
      user_artworks = Artwork.where(artist_id: params[:user_id])
      viewed_artworks = user.viewed_artworks
      render json: user_artworks + viewed_artworks
    else
      render plain: "Invalid user id", status: :unprocessable_entity
    end
  end

  def show
    if artwork
      render json: artwork
    else
      render plain: "Invalid artwork id", status: :unprocessable_entity
    end
  end

  def create
    new_artwork = Artwork.new(artwork_params)
    if new_artwork.save
      render json: new_artwork
    else
      render json: new_artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if artwork
      Artwork.update(params[:id], artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork_to_delete = artwork
    if artwork
      artwork.destroy
      render json: artwork_to_delete
    else
      render plain: "Invalid artwork id", status: :unprocessable_entity
    end
  end

  def favorite
    artwork_to_favorite = Artwork.find_by_id(params[:artwork_id])
    if artwork_to_favorite
      artwork_to_favorite.update(favorite: true)
      render json: artwork_to_favorite
    else
      render plain: "Invalid artwork id", status: :unprocessable_entity
    end
  end

  private

  def artwork
    Artwork.find_by_id(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end