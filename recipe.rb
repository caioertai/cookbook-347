class Recipe
  attr_reader :name, :description, :prep_time

  def initialize(attributes = {})
    # attributes = {
    #   name: "Pizza",
    #   description: "Cheese and crust",
    #   prep_time: "50min",
    #   done: true
    # }
    @name = attributes[:name]
    @description = attributes[:description]
    @prep_time = attributes[:prep_time]
    @done = attributes[:done] || false
  end

  def mark_as_done!
    @done = true
  end

  def done?
    @done
  end

  def to_csv_row
    [@name, @description, @prep_time, @done]
  end
end
