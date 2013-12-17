puts "What's your name?"
name = gets.chomp
vowelsounds = ["a", "e", "f", "h", "i", 'l', "m", "n", "o", "r", "s", "x"]
characters = ["-", "'", " "]
name.each_char do |char|
  if vowelsounds.include?(char)
    mychar = "an"
  else
    mychar = "a"
  end
  unless characters.include?(char)
    puts "Give me #{mychar}.. #{char.upcase}"
  end
end
if name.length == 0
  puts "Hey, you didn't enter your name!"
else
  puts name.upcase + " is GRAND!"
end
