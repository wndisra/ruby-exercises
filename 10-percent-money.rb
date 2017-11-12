print "Input some money: "
money = gets.chomp.to_f

change = 0.1 * money
# Using round to place two decimal floating point
puts "Your change: #{change.round(2)}"
