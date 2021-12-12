=begin 
  bit全探索問題

=end

# AC回答 ref済み
N = gets.to_i
if N.odd?
  puts ""
  exit
end
list = []

["(",")"].repeated_permutation(N).each do |bits| #O(2^N)
  next unless bits.count("(") == bits.count(")") #(,)の数が等しい必要がある O(N)

  open = close = 0
  is_all_ok = bits.all? do |b| # O(N)
    b == "(" ? open += 1 : close += 1
    open >= close
  end
  list << bits.join if is_all_ok
end
puts list
