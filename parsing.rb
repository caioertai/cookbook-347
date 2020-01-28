# WE'RE NOT USING THIS
# It was just a tester for the scraping

require "open-uri"
require "nokogiri"

# Load the file from the web as a string
html = open("https://www.bbcgoodfood.com/search/recipes?query=cheese").read

# Parse the string as a Nokogiri document
doc = Nokogiri::HTML(html)

# We search for the elements in the page that represent recipes
# and iterate over them.
recipes = doc.search(".node-recipe").first(5).map do |recipe_element|
  # The next steps need some understanding of CSS selectors and Nokogiri queries
  # But... essentially, we found that we can get:

  # Recipe name from the h3 of each recipe_element
  name        = recipe_element.at("h3").text.strip
  # Recipe description from the .field-type-text-with-summary of each recipe_element
  description = recipe_element.at(".field-type-text-with-summary").text
  # Recipe prep_time from the .teaser-item__info-item--total-time of each recipe_element
  prep_time   = recipe_element.at(".teaser-item__info-item--total-time").text.strip

  # And we don't  want to EVER handle recipes as strings, or arrays... or hashes
  # WE HAVE A RECIPE MODEL! So we use it as soon as possible.
  Recipe.new(name: name, description: description, prep_time: prep_time)
end

p recipes
