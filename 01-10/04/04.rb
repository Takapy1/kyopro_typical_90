=begin 
  行の和、列の和
=end

H, W = gets.split.map &:to_i
matrix = []
row_sums = []; col_sums = []

# 行の和を求める
H.times do |i|
  a = gets.split.map &:to_i
  row_sums << a.sum
  matrix << a
end

# 列の和を求める
matrix.transpose.each do |col|
  col_sums << col.sum
end


H.times do |i|
  row = []
  W.times do |j|
    row << row_sums[i] + col_sums[j] - matrix[i][j]
  end
  puts row.join(" ")
end
