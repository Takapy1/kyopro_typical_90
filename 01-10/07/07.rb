=begin 
  point 
    二分探索(見つからない時の処理)
=end


# AC回答
N = gets.to_i
A = gets.split.map &:to_i
A.sort!
Q = gets.to_i
Q.times do |i|
  b = gets.to_i
  bigger_idx = A.bsearch_index{ |x| x >= b }
  if bigger_idx.nil?
    puts (b - A[-1]).abs
  else
    big = (b - A[bigger_idx]).abs
    small = (b - A[bigger_idx - 1]).abs
    puts [big, small].min
  end
end
