# frozen_string_literal: true

class RecipeAndMaterialRecord < ApplicationRecord
  belongs_to :recipe
  belongs_to :material
end
