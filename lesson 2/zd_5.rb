#
# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
# Найти порядковый номер даты, начиная отсчет с начала года. 
# Учесть, что год может быть високосным.
#
puts "Введите год:"
year = gets.to_i
puts "Введите месяц:"
month = gets.to_i
puts "Введите день:"
day = gets.to_i
 
days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
days_in_months [1] = 29 if year%4 == 0 && year%100 != 0 || year%400 == 0
 
days = 0
 
if month == 1
  days = day
else
  n = 0
 while n < (month-1) do
   days += days_in_months [n]
   n += 1
 end
 days += day
end
 
 
puts "На дату #{day}.#{month}.#{year} прошло #{days} дней с 1 января"

