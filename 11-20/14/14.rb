N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

A.sort!; B.sort!
min = 0
N.times do |i|
  min += (A[i] - B[i]).abs
end
puts min
