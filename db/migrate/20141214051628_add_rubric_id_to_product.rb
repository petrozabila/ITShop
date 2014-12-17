class AddRubricIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :rubric_id, :integer
  end
end
