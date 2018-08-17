class Recipe < ActiveRecord::Base
  has_many :ingredients
  # accepts_nested_attributes_for :ingredients

  def ingredients_attributes= ings
    # byebug
    ings.each do |num,ing_hash|
      # ing_to_be_added = Ingredient.find_or_create_by ing_hash
      # ingredients << ing_to_be_added
      # save
      self.ingredients.build ing_hash

    end
  end
end
