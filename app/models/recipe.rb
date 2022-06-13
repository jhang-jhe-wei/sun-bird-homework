class Recipe < ApplicationRecord
  has_many :recipe_and_material_records
  has_many :materials, through: :recipe_and_material_records
end
