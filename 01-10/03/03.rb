=begin 
  BFS(幅優先探索)を使用した問題
  木の直径（木の中で最も長い道の数）→2回探索
=end

# AC回答
N = gets.to_i
routes = Array.new(N) { [] }
(N-1).times do
  a, b = gets.split.map &:to_i
  a -= 1; b -= 1
  routes[a] << b
  routes[b] << a
end

# startからの距離のリストを返す
def bfs(num_node, start, list)
  dist = Array.new(num_node) { nil } #戻り値
  dist[start] = 0

  queue = [start]
  until queue.empty?
    v = queue.shift
    list[v].each do |u|
      next unless dist[u].nil? # すでに探索済み
      dist[u] = dist[v] + 1
      queue << u
    end
  end
  dist
end

# 0からの距離が大きい値を持つノードを求める
dist = bfs(N, 0, routes)
max_val = dist.max
max_node = dist.index(max_val)
# 上で求めたノードからの距離が最も大きい値を求める
dist = bfs(N, max_node, routes)
puts dist.max + 1