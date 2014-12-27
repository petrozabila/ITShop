class Product < ActiveRecord::Base

	has_many :product_rubrics
	has_many :rubrics, through: :product_rubrics

	mount_uploader :image, ImageUploader


  validates :title,
            presence: true, uniqueness: true, length: {in: 4..30}
  validates :price,
            presence: true, numericality: { greater_than_or_equal_to: 1.00 }

end
