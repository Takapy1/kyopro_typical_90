N, K = gets.split.map &:to_i
A = gets.split.map &:to_i
B = gets.split.map &:to_i

num_op = N.times.sum { |i| (B[i] - A[i]).abs }
puts (K >= num_op) && (K - num_op).even? ? 'Yes' : 'No'

# N.times do |i|
#   if A[i] - K > B[i] || B[i] > A[i] + K
#     puts "No"
#     exit
#   end
# end
# puts "Yes"