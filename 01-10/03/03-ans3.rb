=begin 
  グラフの最短距離求めるメソッド
=end

class Graph
  def initialize(n); @g = Array.new(n){ [] }; end
  def add_edge(u,v); @g[u] << v; @g[v] << u; self; end # 双方向の変を追加

  # 深さ優先探索でsノードからそれぞれのノードへの最短距離を求める, 結果はusedに入って帰る
  def shortest_path(s)
    used = Array.new(@g.size)
    q = [s]
    used[s] = 0
    until q.empty?
      u = q.shift
      d = used[u]
      @g[u].each do |v|
        next if used[v]
        used[v] = d + 1
        q << v
      end
    end
    used
  end
end

N = gets.to_i
G = Graph.new(N)
(N - 1).times do
  a,b = gets.split.map(&:to_i)
  G.add_edge(a - 1,b - 1)
end

dist1 = G.shortest_path(0)
# u = N.times.max_by{ dist1[_1] }
u = dist1.max


dist2 = G.shortest_path(u)
puts dist2.max + 1