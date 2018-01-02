class ArtworksController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @artworks = @user.shared_artworks.to_a + @user.artworks.to_a
    else
      @artworks = Artwork.all
    end
    render json: @artworks, status: 200
  end

  def create
    # render json: params
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork, status: 200
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
    render json: @artwork, status: 200
  end

  def update
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork
      @artwork.update(artwork_params)
      redirect_to artwork_url(@artwork)
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork = Artwork.find_by(id: params[:id])
    @artwork.destroy
    redirect_to artworks_url
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end
