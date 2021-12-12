# AC回答
def is_ok?(dif, x)
  length = 0
  cnt = 0

  dif.each do |d|
    length += d
    if length >= x
      length = 0
      cnt += 1
    end
  end
  cnt
end

N, L = gets.split.map &:to_i
K = gets.to_i
A = gets.split.map &:to_i
A.push(L)

dif = [A[0]]
N.times do |i|
  dif << (A[i+1] - A[i])
end

ok = -1 #絶対できる長さ
ng = L + 1 #絶対無理な長さ

while ng - ok > 1
  mid = (ng + ok) / 2

  is_ok?(dif, mid) >= K + 1 ? ok = mid : ng = mid
end
puts ok
