filename = ARGV.first

# Open a file
txt = open(filename)

puts "Here's your file #{filename}:"
print txt.read # Show the file content

print "\n\nType the filename again: "
file_again = $stdin.gets.chomp

txt_again = open(file_again)

print txt_again.read

txt.close
txt_again.close
