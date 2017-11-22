the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

# Traditional loops
# for number in the_count
the_count.each do |number|
  puts "This is count #{number}"
end

# Loops in ruby way (Recommended)
fruits.each do |fruit|
  puts "A fruit of type: #{fruit}"
end

# With a different syntax
change.each { |i| puts "I got #{i}" }

# Build a list
elements = []

# Use range operator in loops
(0..5).each do |i|
  puts "Adding #{i} to the list."

  elements.push(i)
end

# Print them out
elements.each { |i| puts "Element was: #{i}" }
