require_relative "view"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def mark_a_recipe
    # Ask COOKBOOK for recipes
    recipes = @cookbook.all
    # Ask VIEW to display recipes
    @view.display(recipes)
    # Ask VIEW to ask the user for an index
    recipe_index = @view.ask_for_index
    # Ask COOKBOOK to mark the recipe
    @cookbook.mark_recipe(recipe_index)
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
    recipe_name = @view.ask_for("name")
    # Ask VIEW to ask the user for a recipe description
    recipe_description = @view.ask_for("description")
    # Ask VIEW to ask the user for a recipe prep_time
    recipe_prep_time = @view.ask_for("prep_time")
    # Ask Recipe to create an instance of a recipe
    new_recipe = Recipe.new(
      name: recipe_name,
      description: recipe_description,
      prep_time: recipe_prep_time
    )
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
