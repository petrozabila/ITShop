class Rubric < ActiveRecord::Base
	
	has_many :product_rubrics
	has_many :products, through: :product_rubrics

	acts_as_list

  scope :sorted, -> { order(:position) }

end
