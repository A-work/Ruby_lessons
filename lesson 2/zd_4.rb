#
# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
#
hash = {}
vowels = %w(a e i o y)
 
('a'..'z').each_with_index do |val, key|
  hash[key+1] = val if vowels.include?(val)
end
 
puts hash