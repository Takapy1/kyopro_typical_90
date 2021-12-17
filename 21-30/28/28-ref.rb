
MAX = 1000
MAX.freeze

def cumulative_sum(arr_2dim)
  arr_2dim.each do |row|
    row[1..-1].map!.with_index { |x, j| x = x[j - 1] + x[j] }
  end
  arr_2dim
end

N = gets.to_i
masses = Array.new(MAX + 1) { Array.new(MAX + 1) { 0 } }

N.times do
  lx, ly, rx, ry = gets.split.map(&:to_i)
  masses[lx][ly] += 1
  masses[rx][ry] += 1
  masses[lx][ry] -= 1
  masses[rx][ly] -= 1
end

masses = cumulative_sum(cumulative_sum(masses).transpose)

list = Array.new(N + 1) { 0 } # ０まいからN枚の可能性があるのでN+1

masses.each do |row|
  row.each do |fac|
    list[fac] += 1
  end
end

puts list[1..N]