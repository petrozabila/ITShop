class CreateRubrics < ActiveRecord::Migration
  def change
    create_table :rubrics do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
