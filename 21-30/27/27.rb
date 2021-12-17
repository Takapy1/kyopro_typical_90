=begin 
  hashの扱い
  has_key?メソッド
=end

# AC解答
# hashへのアクセスはO(logN)
N = gets.to_i
users = {}
N.times do |i|
  name = gets.chomp
  unless users.has_key?(name)
    users[name] = true
    puts i + 1
  end
end