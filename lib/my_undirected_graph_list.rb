require 'set'

# 無向グラフ(隣接リスト)
class MyUndirectedGraphList
  attr_accessor :adj_list

  def initialize
    @adj_list = Hash.new { |h, k| h[k] = [] }  # デフォルト値に空配列を設定
  end

  # 無向辺を追加
  def add_edge(u, v)
    @adj_list[u] << v unless @adj_list[u].include?(v)
    @adj_list[v] << u unless @adj_list[v].include?(u)
  end

  # グラフ表示
  def show
    @adj_list.map { |node, neighbors| "#{node} => #{neighbors.join(', ')}" }.join("\n")
=begin
    @adj_list.each do |node, neighbors|
      puts "#{node} => #{neighbors.join(', ')}"
    end
=end
  end

  # 深さ優先探索(DFS)
  def dfs(start, visited = Set.new, result = [])
    return result if visited.include?(start)
    #puts "DFS visit: #{start}"
    result << start
    visited.add(start)
    @adj_list[start].each do |neighbor|
      dfs(neighbor, visited, result)
    end
    result
  end

  # 幅優先探索(BFS)
  def bfs(start, result = [])
    visited = Set.new
    queue = [start]

    until queue.empty?
      node = queue.shift
      next if visited.include?(node)
      #puts "BFS visit: #{node}"
      result << node
      visited.add(node)
      queue.concat(@adj_list[node])
    end
    result
  end

  # 辺を削除
  def delete_edge(u, v)
    @adj_list[u]&.delete(v)
    @adj_list[v]&.delete(u)
  end

  # 頂点を削除
  def delete_vertex(u)
    return nil unless @adj_list.key?(u)
  
    @adj_list.delete(u)
    @adj_list.each do |_, neighbors|
      neighbors.delete(u)
    end
  end
end
