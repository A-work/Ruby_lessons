#
# Заполнить массив числами фибоначчи до 100.
#
fibonacci = [0, 1]
 
while (new_element = fibonacci[-2] + fibonacci[-1]) < 100 do
  fibonacci << new_element
end
 
puts fibonacci