class UnionFind
  def initialize(n)
    @par = (0..n).to_a
    @size = Array.new(n+1, 1)
  end
 
  def root(v)
    if @par[v] == v
      v
    else
      @par[v] = root(@par[v])
    end
  end
 
  def merge(u, v) #u,vはノードの番号が渡される
    u = root(u)
    v = root(v)
    return false if u == v
 
    u,v = v,u if @size[u] < @size[v]
    @size[u] += @size[v]
    @par[v] = u
    true
  end
 
  def size(u)
    @size[root(u)]
  end
 
  def same?(u, v)
    root(u) == root(v)
  end
end
 
h, w = gets.split.map(&:to_i)
q = gets.to_i

# 一つ一つのマスがノード
uni = UnionFind.new(h*w)
# 各マスがredかどうかを表す2次元配列, 赤ならtrue
red = Array.new(h) { Array.new(w, false) } 

q.times do
  query = gets.split.map(&:to_i)
  op = query.shift #先頭を取ってくる
 
  case op
  when 1
    r, c = query.map { _1 - 1 }
    red[r][c] = true # そのマス目を赤にする


    # ノードの番号が2次元になっていないので面倒
    uni.merge((r-1)*w + c, r*w + c) if r-1 >= 0 && red[r-1][c] #上 配列外参照していない && 上のマスが赤
    uni.merge(r*w + c-1, r*w + c) if c-1 >= 0 && red[r][c-1] #左 配列外参照していない && 左のマスが赤
    uni.merge((r+1)*w + c, r*w + c) if r+1 < h  && red[r+1][c] #下 配列外参照していない && 下のマスが赤
    uni.merge(r*w + c+1, r*w + c) if c < w && red[r][c+1] #右 配列外参照していない && 右のマスが赤
  when 2
    ra, ca, rb, cb = query.map { _1 - 1 }
    if red[ra][ca] and red[rb][cb] and uni.same?(ra*w + ca, rb*w + cb)
      puts "Yes"
    else
      puts "No"
    end
  end
end