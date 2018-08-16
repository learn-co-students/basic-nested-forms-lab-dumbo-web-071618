class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "ingredient1")
    @recipe.ingredients.build(name: "ingredient2")

  end

  def create
    @recipe = Recipe.create(ingredients_params)
    # @recipe.ingredients.build(ingredient_type: )
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  private
  def ingredients_params
    params.require("recipe").permit(:title, ingredients_attributes:[:name,:quantity])
  end

end
