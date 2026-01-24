class MySet
  def initialize
    @data = {}
  end

  # 要素を追加
  def add(x)
    @data[x] = true
  end

  # 要素が含まれているか確認
  def include?(x)
    @data.key?(x)
  end

  # 要素を削除
  def remove(x)
    @data.delete(x)
  end

  # 要素数を返す
  def size
    @data.size
  end

  # 要素を配列として返す
  def to_a
    @data.keys
  end
end