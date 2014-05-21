class WishlistsController < ApplicationController

	def index
		@wishlists = current_user.wishlists.all 
	end

	def show
		@wishlist = Wishlist.find(params[:id])
	end

	def create
		@wishlist = current_user.wishlists.build(wishlist_params)
		if @wishlist.save
			redirect_to :back, notice: "Wishlist added."
		else
			redirect_to :back, alert: "Failed to save."
		end
	end

	private

	def wishlist_params
		params.require(:wishlist).permit!
	end
end
