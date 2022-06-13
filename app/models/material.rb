# frozen_string_literal: true

class Material < ApplicationRecord
  has_many :recipe_and_material_records, dependent: :destroy
  has_many :recipes, through: :recipe_and_material_records
end
