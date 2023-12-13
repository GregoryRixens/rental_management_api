class ListingsController < ApplicationController
  def index
    listings = Listing.all
    render json: { listings: listings }
  end

  def show
    listing = Listing.find(params[:id])
    render json: { listing: listing }
  end

  def create
    listing = Listing.create!(listing_params)
    render json: { listing: listing }, status: :created
  end

  def update
    listing = Listing.find(params[:id])
    listing.update!(listing_params)
    render json: { listing: listing }
  end

  def destroy
    listing = Listing.find(params[:id])
    listing.destroy
    head :no_content
  end

  private

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end
end
