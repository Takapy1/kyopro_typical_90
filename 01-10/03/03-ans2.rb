n=gets.to_i
list=Array.new(n+1){Array.new}
#隣接リスト表現作成
(n-1).times do
  a,b=gets.chomp.split(' ').map(&:to_i)
  list[a] << b
  list[b] << a
end
p list
 
#t = ノードの総数 f = 初期ノード list = 隣接リスト
def bfs(t, f, list)
  #dist = dist[v]には、ある頂点から頂点vまでの距離を格納
  #dist[v] == -1でその頂点vが探索済みかどうか調べられる
  dist = Array.new(t){-1}
  #queには探索予定の頂点を格納
  que = []
  #初期ノードに距離0を設定
  dist[f - 1] = 0
  #初期ノードを探索予定に追加
  que << f
  while !(que.empty?) do
    #キューから先頭の頂点を取り出して削除
    v = que.shift
    #vに隣接する頂点を全て調べる
    list[v].each do |l|
      #探索済みの頂点は調べない
      next if dist[l - 1] != -1
      
      #頂点lはvの隣なので、lの距離はvの距離に1を足せばいい
      dist[l - 1] = dist[v - 1] + 1
      
      #lを探索予定に追加
      que << l
    end
  end
    dist
end
 
distance = bfs(n, 1, list).max
index = bfs(n, 1, list).index(distance)
p bfs(n, index + 1, list).max + 1

