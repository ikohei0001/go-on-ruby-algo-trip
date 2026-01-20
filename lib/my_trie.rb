class Node
  attr_accessor :children, :terminal

  def initialize
    @children = {}
    @terminal = false
  end
end

class MyTrie
  def initialize
    @root = Node.new
  end

  def insert(word)
    node = @root
  
    word.each_char do |char|
      node.children[char] ||= Node.new # 既存の場合Node.newをしない
      node = node.children[char]
    end

    node.terminal = true
  end

  def include?(word)
    node = @root

    word.each_char do |char|
     return false unless node.children.key?(char)
     node = node.children[char]
    end

    node.terminal
  end

  def start_with?(prefix)
    node = @root
  
    prefix.each_char do |char|
     return false unless node.children.key?(char)
     node = node.children[char]
    end

    true
  end

  def words
    result = []
    node = @root
    dfs(node, "", result)
    result
  end

  def delete(word)
    delete_rec(@root, word, 0)
  end

  private

  def dfs(node, prefix, result)
    result << prefix if node.terminal

    node.children.each do |char, child|
      dfs(child, prefix + char, result)
    end
  end

  def delete_rec(node, word, index)
    if index == word.length
      return false unless node.terminal
      node.terminal = false
      return node.children.empty?
    end

    char = word[index]
    child = node.children[char]
    return false unless child

    delete_child = delete_rec(child, word, index + 1)

    if delete_child
      node.children.delete(char)
    end

    node.children.empty? && !node.terminal
  end
end
