=begin 
  point 
  大きい順に使用すればいいわけじゃない！！！
  ちょうどNにならないといけないから、うまく硬貨を使用してNになるようにしないといけない

=end

# RubyだとTLEになる！！！
N = gets.to_i
A,B,C = gets.split.map(&:to_i)

min_coin = 9999

max = 9999
(0..max).each do |a|
  (0..(max-a)).each do |b|
    remain = N - (A * a + B * b)
    total = a + b + remain/C
    next if remain % C != 0 || remain < 0 || total > 9999 
    min_coin = [total, min_coin].min
    # if remain % C == 0 #後Cを使ってN円を払える
    #   c = remain / C
    #   total = a + b + c
    #   min_coin = [total, min_coin].min
    # end
  end
end
puts min_coin

