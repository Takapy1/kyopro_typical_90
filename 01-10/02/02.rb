=begin 
  bit全探索問題

=end


N = gets.to_i
if N.odd?
  puts ""
  exit
end
list = []

["(",")"].repeated_permutation(N).each do |bits|
  next unless bits.count("(") == bits.count(")") #(,)の数が等しい必要がある O(N)

  cnt_l = 0
  cnt_r = 0
  is_all_ok = bits.all? do |b|
    b == "(" ? cnt_l += 1 : cnt_r += 1
    cnt_l >= cnt_r
  end
  if is_all_ok
    list << bits.join
  end

  # bits.each do |b|
  #   b == "(" ? cnt_l += 1 : cnt_r += 1
  #   next if cnt_l < cnt_r
  # end
  
end

puts list
