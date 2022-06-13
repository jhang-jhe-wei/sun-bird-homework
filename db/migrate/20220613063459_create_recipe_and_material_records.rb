class CreateRecipeAndMaterialRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_and_material_records do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.float :quantity
      t.string :format

      t.timestamps
    end
  end
end
