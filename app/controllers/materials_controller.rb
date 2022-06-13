class MaterialsController < ApplicationController
  def index
    unless params[:search]
        @materials = Material.all
    else
        @materials = Material.where("name LIKE ?", "%#{params[:search]}%")
    end
    render json: { results: @materials.map { |material| { id: material.id, text: material.name } } }.to_json
  end
end
