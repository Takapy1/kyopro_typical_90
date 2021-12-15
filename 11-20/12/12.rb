
class UnionFind
  # indexがノードの番号を表している
  attr_accessor :parent

  # @parentでグループ管理する（初期化した時は要素数（size）全て親）
  def initialize(size)
    @parent = Array.new(size, -1)
  end

  # xが属するグループのルートノードを返す
  def root(x)
    if @parent[x] < 0
      x
    else
      # 経路圧縮（ノード付け替え）をする
      @parent[x] = root(@parent[x])
    end
  end

  def same_parent?(x, y)
    root(x) == root(y)
  end

  # xとyが属しているグループを合体
  def merge(x,y)
    x_root = root(x)
    y_root = root(y)

    return false if x_root == y_root

    #マージテク
    x_root, y_root = y_root, x_root if @parent[x_root] > @parent[y_root]
    
    @parent[x_root] += @parent[y_root]
    @parent[y_root] = x_root

    return true
  end

  # xが属するグループのサイズを返す
  def size(x)
    return -@parent[root(x)]
  end
end


H, W = gets.split.map &:to_i
uf = UnionFind.new(H * W)

Q = gets.to_i
Q.times do |i|
  q = gets.split.map &:to_i
  if q.first == 1 #結合
    _1, r, c = q
    uf.merge([r,c])
  else
    _2, ra, ca, rb, cb = q
    puts uf.same_parent?([ra, ca], [rb, cb]) ? "Yes" : "No"
  end
end