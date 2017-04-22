require 'yaml'
require 'strscan'

#Simple recursive parser for the files
def parse input
  split_index = input.index(/[{},]/)
  stack = []
  if split_index ==nil then

  end
  pre_string = input[0..split_index-1].strip
  post_string = input[split_index+1..input.length].strip
  case input[/[{},]/]
  when "{"
  	stack << parse(post_string) if pre_string==""
  	if pre_string!="" then
  		stack = {}
  		stack[pre_string] = parse(post_string)
  	end
  when "}"
  	stack << pre_string
  	return stack
  when ","
  end
  stack

end

# Import raw recipes
imported_recipes = ""
Dir.foreach('recipe_files') do |recipe_file|
	next if recipe_file == "." or recipe_file == ".."
	raw_file_data = File.read('recipe_files/' + recipe_file)

	#Remove first and last line, which are "data:extend(" and ")", not data
	lines = raw_file_data.split("\n")
	lines = lines[1..lines.length-2]
	raw_file_data = lines.join("\n")

	imported_recipes = parse raw_file_data

end

#puts imported_recipes

q = parse "asdf { asdf2 { asdf3 }}}"
puts q.inspect

