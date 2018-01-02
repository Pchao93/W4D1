class ArtworkSharesController < ApplicationController

  def create
    @share = ArtworkShare.new(share_params)
    if @share.save
      render json: @share, status: 200 # artwork_url(id: params[:id])
    else
      render json: @share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @share = ArtworkShare.find_by(id: params[:id])
    @share.destroy
    render json: @share, status: 200
  end


  private

  def share_params
    params.require(:share).permit(:viewer_id, :artwork_id)
  end
end
