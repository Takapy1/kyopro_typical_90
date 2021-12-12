N, L = gets.split.map &:to_i
K = gets.to_i
A = gets.split.map &:to_i
A.push(L)

# 間の長さを持つ必要がある
diffs = []
N.times do |i|
  diffs << A[i+1] - A[i]
end


left = -1 #絶対できる長さ
right = L + 1 #絶対無理な長さ

# 長さxのピースがK+1こできるかどうか
# ans = (left..right).bsearch do |x|
#   length = 0
#   cnt = 0
#   diffs.each_with_index do |dif, i|
#     length += dif
#     if length >= x
#       cnt += 1
#       length = 0
#     end
#   end
#   cnt >= K + 1
# end

# puts ans

while right - left > 1
  mid = (right + left) / 2

  length = 0
  cnt = 0
  diffs.each do |dif|
    length += dif
    if length >= dif
      cnt += 1
      length = 0
    end
  end

  cnt >= K + 1 ? left = mid : right = mid
end

puts left
