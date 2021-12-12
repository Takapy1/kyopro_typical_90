# frozen_string_literal: true
 
N = gets.to_i
Routes = Hash.new { |hash, key| hash[key] = [] }
(N - 1).times do
  a, b = gets.split(' ').map(&:to_i)
  Routes[a] << b
  Routes[b] << a
end
 
def bfs(start)
  q = [[start, 0]]
  visited = {}
  while q.any?
    i, count = q.shift
    visited[i] = true
 
    Routes[i].each do |next_i|
      next if visited[next_i]
 
      Record[next_i] = count + 1
      q << [next_i, count + 1]
    end
  end
end
 
Record = {}
bfs(1)
k, v = Record.max_by { |_k, v| v }
 
Record = {}
bfs(k)
k, v = Record.max_by { |_k, v| v }
 
puts v + 1