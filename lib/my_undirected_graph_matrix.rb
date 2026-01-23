# 無向グラフ(隣接行列)
class MyUndirectedGraphMatrix
  def initialize(vertices)
    @vertices = vertices
    @size = vertices.size
    @matrix = Array.new(@size) { Array.new(@size, 0) }
    @index = vertices.each_with_index.to_h
  end

  # 無向辺を追加
  def add_edge(u, v)
    i = @index[u]
    j = @index[v]
    @matrix[i][j] = 1
    @matrix[j][i] = 1
  end

  # 辺の有無を確認
  def edge?(u, v)
    i = @index[u]
    j = @index[v]

    @matrix[i][j] == 1
  end

  # 隣接行列を文字列として返す
  def show
    "   #{@vertices.join(' ')}\n" +
    @matrix.each_with_index.map { |row, i| "#{@vertices[i]}  #{row.join(' ')}" }.join("\n")
  end

  # 辺を削除
  def delete_edge(u, v)
    i = @index[u]
    j = @index[v]

    @matrix[i][j] = 0
    @matrix[j][i] = 0
  end

  # 頂点を削除
  def delete_vertex(v)
    del_v = @index[v]

    @matrix.delete_at(del_v)
    @matrix.each { |row| row.delete_at(del_v) }
    
    @vertices.delete_at(del_v) 
    @size -= 1
    @index = @vertices.each_with_index.to_h
  end
end
