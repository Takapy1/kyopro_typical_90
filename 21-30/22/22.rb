A, B, C = gets.split.map &:to_i
x = A.gcd(B).gcd(C)

ans = (A/x-1) + (B/x-1) + (C/x-1)
puts ans