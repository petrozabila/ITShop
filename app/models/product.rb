class Product < ActiveRecord::Base

	has_many :product_rubrics
	has_many :rubrics, through: :product_rubrics
	has_many :order_items

	acts_as_votable

	mount_uploader :image, ImageUploader


  validates :title,
            presence: true, uniqueness: true, length: {in: 4..30}
  validates :price,
            presence: true, numericality: { greater_than_or_equal_to: 1.00 }

	paginates_per 4


	def score
	  self.get_upvotes.size - self.get_downvotes.size
	end

end
