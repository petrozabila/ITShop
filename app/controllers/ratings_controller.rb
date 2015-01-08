class RatingController < ApplicationController

	def rate
		@product = Product.find(params[:id])
		Rating.delete_all([“rateable_type = ‘Product’ AND rateable_id = ? AND product_id = ?”,
		@product.id])
		@product.add_rating Rating.new(:rating => params[:rating],
		:product_id => @product.id)
	end

end