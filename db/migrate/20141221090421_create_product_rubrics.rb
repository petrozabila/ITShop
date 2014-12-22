class CreateProductRubrics < ActiveRecord::Migration
  def change
    create_table :product_rubrics do |t|
      t.belongs_to :product, index: true
      t.belongs_to :rubric, index: true

      t.timestamps null: false
  end
  	add_foreign_key :product_rubrics, :products
  	add_foreign_key :product_rubrics, :rubrics
  end
end
