=begin 
  point 
    誤差(float, double long doubleなど）の扱い
    logの式変形
=end

# puts Math.log(a,2) < b * Math.log(c, 2) ? "Yes" : "No" #これでは誤差でWAとなる

# AC解答
a, b, c = gets.split.map &:to_i
puts a < c ** b ? "Yes" : "No"