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

  def mark_recipe(index)
    # Pick the recipe from the array
    recipe = @recipes[index]
    # Mark it as done
    recipe.mark_as_done!
    # Update CSV
    update_csv
  end

  private

  def update_csv
    CSV.open(@csv_file_path, "wb") do |csv_file|
      @recipes.each do |recipe|
        csv_file << recipe.to_csv_row
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      # row => ["Feijoada", "Water and beans", "70min", "true"]
      # row[3] = row[3] == "true" # => true / false
      typecast_done = row[3] == "true" # => true / false

      @recipes << Recipe.new(
        name: row[0],
        description: row[1],
        prep_time: row[2],
        done: typecast_done
      )
    end
  end
end
