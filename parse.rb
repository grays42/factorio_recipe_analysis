load 'recipe.rb'

#I have tried my very best to find a simple way to parse that data. Just going to brute force it.
def parse_set_of_recipes input
  #match doesn't like newlines. Replace with a character that is never used.
  input.gsub!("\n","$")

  #get our array of recipes
  items = input.match(/\$\s\s{(.+?)\$\s\s}/)

  recipes = {}
  items.each do |item|
    #Squish all the stuff we don't need
    item.gsub!("$","")
    item.gsub!(" ","")
    recipe = {}
    #Parse out the ingredients first

  end

  return recipes

end