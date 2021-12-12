H, W = gets.split.map &:to_i
a = H.times.map { gets.split.map &:to_i }
row_sum = a.map(&:sum)
col_sum = a.transpose.map(&:sum)

H.times do |i|
  ans = []
  W.times do |j|
    ans << row_sum[i] + col_sum[j] - a[i][j]
  end
  puts ans.join(" ")
end