class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Welcome to the COOKBOOK"

    while @running
      puts "Press 1, 2 or 0"
      puts "1. List recipes"
      puts "2. Add a recipe"
      puts "3. Remove a recipe"
      puts "4. To mark a recipe as done"
      puts "0. To quit"

      print "> "
      user_input = gets.chomp.to_i
      print `clear`

      case user_input
      when 1 then @controller.list
      when 2 then @controller.create
      when 3 then @controller.destroy
      when 4 then @controller.mark_a_recipe
      when 0 then @running = false
      end
    end
  end
end
