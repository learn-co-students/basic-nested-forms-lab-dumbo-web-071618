class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    # byebug
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "Insert Recipe Name")
    @recipe.ingredients.build(name: "Insert Recipe Name")
  end

  def create
    new_recipe = Recipe.new(recipe_params)
    if new_recipe.valid?
      new_recipe.save

      redirect_to recipe_path(new_recipe)
    else

      redirect_to new_recipe_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title,
    ingredients_attributes: [
      :name,
      :quantity
    ])
  end
end
