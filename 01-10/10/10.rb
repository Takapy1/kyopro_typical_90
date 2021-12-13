=begin 
  累積和

=end

N = gets.to_i
class1 = Array.new(N+1) { 0 }
class2 = Array.new(N+1) { 0 }
(1..N).each do |i|
  st_class, st_point = gets.split.map &:to_i
  if st_class == 1
    class1[i] = class1[i-1] + st_point
    class2[i] = class2[i-1]
  else
    class1[i] = class1[i-1]
    class2[i] = class2[i-1] + st_point
  end
end

Q = gets.to_i
Q.times do |i|
  l, r = gets.split.map &:to_i
  puts [class1[r] - class1[l-1], class2[r] - class2[l-1]].join(" ")
end