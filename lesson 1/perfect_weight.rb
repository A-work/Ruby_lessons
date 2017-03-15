puts "Как тебя зовут?"
name = gets.chomp

puts "Какой у тебя рост?"
height = gets.chomp.to_i

optimal_weight = height - 110

if optimal_weight < 0 
	puts "Ваш вес уже оптимальный!"
else
	puts "#{name}, ваш вес оптимальный и равен #{optimal_weight}"
end

