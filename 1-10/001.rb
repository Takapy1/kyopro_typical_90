N, L = gets.split.map &:to_i
K = gets.to_i
a = gets.split.map &:to_i

# 最小値の最大値　二分探索

left = 0
right = L

while left + 1 != right
  mid = (left + right) / 2

  # 最小値がmidになるようにできるか判定
  # K+1とK本を並べる全通り試す

  #　範囲絞る
  if min < mid
    right = mid
  else
    left = mid
  end
end

puts right

