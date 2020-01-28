class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      # recipe => and instance of a recipe
      x = recipe.done? ? "[x]" : "[ ]"
      puts "#{index + 1}. #{x} #{recipe.name}:#{recipe.prep_time}\n       #{recipe.description}\n "
    end
  end

  def ask_for(thing)
    puts "What's the recipe #{thing}?"
    gets.chomp
  end

  def ask_for_index
    puts "Which recipe (by number)?"
    gets.chomp.to_i - 1
  end
end
