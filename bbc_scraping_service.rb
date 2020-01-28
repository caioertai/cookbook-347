require "open-uri"
require "nokogiri"
require_relative "recipe"

# This is using the service object pattern described in the challenges today.

# The important thing is:

# We created this to handle the whole logic related to:
# - going on the web
# - finding the relevant info
# - returning an array of recipe instances
class BBCScrapingService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    # READ THE scraping.rb FILE FOR MORE INFO ON THE STEPS of this method
    html = open("https://www.bbcgoodfood.com/search/recipes?query=#{@keyword}").read
    doc = Nokogiri::HTML(html)

    # This is the last statement in the method. And it's iterating with a #map
    # So it's returning an array of instances of Recipe
    doc.search(".node-recipe").first(5).map do |recipe_element|
      name = recipe_element.at("h3").text.strip
      description = recipe_element.at(".field-type-text-with-summary").text
      prep_time = recipe_element.at(".teaser-item__info-item--total-time").text.strip
      Recipe.new(name: name, description: description, prep_time: prep_time)
    end
  end
end
