# frozen_string_literal: true

class MaterialsController < ApplicationController
  def index
    @materials = if params[:search]
                   Material.where('name LIKE ?', "%#{params[:search]}%")
                 else
                   Material.all
                 end
    render json: { results: @materials.map { |material| { id: material.id, text: material.name } } }.to_json
  end
end
