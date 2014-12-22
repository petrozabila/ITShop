class ProductRubric < ActiveRecord::Base
  belongs_to :product
  belongs_to :rubric
end
