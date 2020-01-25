require_relative "view"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def destroy
    # Ask COOKBOOK for all the recipes
    recipes = @cookbook.all
    # Ask VIEW to display the recipes
    @view.display(recipes)
    # Ask VIEW to ask user for a recipe to remove (by index)
    recipe_index = @view.ask_for_index
    # Ask COOKBOOK to remove recipe
    @cookbook.remove_recipe(recipe_index)
  end

  def create
    # Ask VIEW to ask the user for a recipe name
    name = @view.ask_for("name")
    # Ask VIEW to ask the user for a recipe description
    description = @view.ask_for("description")
    # Ask Recipe to create an instance of a recipe
    new_recipe = Recipe.new(name, description)
    # Ask COOKBOOK to store the recipe
    @cookbook.add_recipe(new_recipe)
  end

  def list
    # 1. Ask COOKBOOK for recipes
    recipes = @cookbook.all
    # 2. Ask VIEW to display them
    @view.display(recipes)
  end
end
