class ListingsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy, :update, :new, :edit]
before_action :correct_user, 	 only: :destroy

	def create
		@listing = current_user.listings.build(listing_params)
		if @listing.save
			flash[:success] = "listing created!"
			redirect_to listing_path(params[:id])
		else
			@feed_items = [] # Catch if empty listing posted at 'home'			
			render 'static_pages/home'
		end
	end

	def destroy
		@listing.destroy
		flash[:success] = "listing deleted"
		redirect_to request.referrer || root_url
	end

	def new
		@listing = current_user.listings.build 
	end

	def show
		@user = User.find(current_user.id)
		@listing = Listing.find(params[:id])
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
    @listing.update_attributes(listing_params) 
    @listing.save
    flash[:success] = "listing updated"
    redirect_to listing_path(params[:id])
  end 
		
	def index
		@listing = Listing.all
	end

	private

		def listing_params
			params.require(:listing).permit(
				:cartype, :model, :year, :color, :price, :mileage, :sound_system, 
				:tinting, :security_lock, :description, :picture, :pic_bonnet, 
				:pic_boot, :remove_picture, :remove_pic_bonnet, :remove_pic_boot, :picture_cache)
		end

		def correct_user
			@listing = current_user.listings.find_by(id: params[:id])
			redirect_to root_url if @listing.nil?
		end
end
