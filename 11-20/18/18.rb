
=begin 
point
  ＜幾何問題＞
  三角関数、逆算各区関数、
=end
# 方針はマジであってる

def now_xyz(l, rt, t)
  x, y, z = 0, -l/2 * Math.sin(t*6/rt), l/2 * (1 - Math.cos(t*6/rt))
  return [x,y,z]  
end
T = gets.to_i
L, X, Y = gets.split.map &:to_i
Q = gets.to_i
Q.times do |i|
  puts 
  e = gets.to_i * 60
  # どこにいるのか
  x, y, z = now_xyz(L, T, e)
  p "xyz: #{x} #{y} #{z}"
  # 角度の算出
  b = z
  a = Math.sqrt((Y - y).abs ** 2 + X ** 2)
  puts Math.atan(b/a)
end
