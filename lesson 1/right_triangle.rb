print "Сторона А "
a = gets.to_f
 
print "Сторона B "
b = gets.to_f
 
print "Сторона C "
c = gets.to_f
 
if a > b && a > c
  hypotenuse, a, b = a, b, c
elsif b > a && b > c
    hypotenuse , b = b, c
elsif c > a && c > b
    hypotenuse = c
else
    puts "Треугольник не прямоугольный."
end
 
#  если гипотенуза есть, вычисляем по формуле Пифагора
if hypotenuse && hypotenuse ** 2 == a**2 + b ** 2
    puts "Треугольник прямоугольный."
elsif hypotenuse
    puts "Треугольник не прямоугольный."    
end
 
#равнобедренный ли треугольник
if a == b || a == c || c == b
    puts "Треугольник равнобедренный."
end