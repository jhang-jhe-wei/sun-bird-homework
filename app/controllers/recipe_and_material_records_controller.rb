# frozen_string_literal: true

class RecipeAndMaterialRecordsController < ApplicationController
  before_action :set_recipe, only: %i[new create]
  before_action :set_recipe_and_material_record, only: :destroy

  def index
    redirect_to new_recipe_recipe_and_material_record_url
  end

  def new
    @recipe_and_material_record = @recipe.recipe_and_material_records.build
  end

  def create
    @recipe_and_material_record = @recipe.recipe_and_material_records.new(recipe_and_material_record_params)
    if @recipe_and_material_record.save
      redirect_to recipe_url(@recipe.id), notice: '已加入此材料'
    else
      render :new
    end
  end

  def destroy
    @recipe_and_material_record.destroy
    redirect_to recipe_url(@recipe.id), notice: '刪除成功'
  end

  private

  def set_recipe
    @recipe = current_user.recipes.find(params[:recipe_id])
  end

  def set_recipe_and_material_record
    @recipe_and_material_record = RecipeAndMaterialRecord.includes(recipe: :user).find_by(id: params[:id],
                                                                                          user: { id: current_user.id })
  end

  def recipe_and_material_record_params
    params.require(:recipe_and_material_record).permit(:material_id, :format, :quantity)
  end
end
