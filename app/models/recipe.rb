# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :recipe_and_material_records, dependent: :destroy
  has_many :materials, through: :recipe_and_material_records
  belongs_to :user
  scope :search, ->(text) { where('name LIKE ?', "%#{text}%") }
end
