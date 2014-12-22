class Product < ActiveRecord::Base

	has_many :product_rubrics
	has_many :rubrics, through: :product_rubrics

end
