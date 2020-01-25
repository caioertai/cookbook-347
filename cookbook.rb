require_relative "recipe"
require "csv"

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    update_csv
  end

  def add_recipe(new_recipe)
    @recipes << new_recipe
    update_csv
  end

  private

  def update_csv
    CSV.open(@csv_file_path, "wb") do |csv_file|
      @recipes.each do |recipe|
        csv_file << [recipe.name, recipe.description]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end
end
