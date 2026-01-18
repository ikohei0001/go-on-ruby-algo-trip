class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class MyBST
  attr_accessor :root

  def initialize
    @root = nil
  end
  
  def search(value)
    search_rec(@root, value)
  end

  def search_rec(node, value)
    return false if node.nil?
    return true if node.value == value

    if value < node.value
      search_rec(node.left, value)
    else
      search_rec(node.right, value)
    end
  end

  def insert(value)
    @root = insert_rec(@root, value)
  end

  def insert_rec(node, value)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert_rec(node.left, value)
    elsif value > node.value
      node.right = insert_rec(node.right, value)
    end
    node
  end

  def delete(value)
    @root = delete_rec(@root, value)
  end

  def delete_rec(node, value)
    return nil if node.nil?

    if value < node.value
      node.left = delete_rec(node.left, value)
    elsif value > node.value
      node.right = delete_rec(node.right, value)
    else
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      min_larger_right = find_min(node.right)
      node.value = min_larger_right.value
      node.right = delete_rec(node.right, min_larger_right.value)
    end
    node
  end

  def find_min(node)
    min_larger_right = node
    min_larger_right = min_larger_right.left while min_larger_right.left
    min_larger_right
  end

  def inorder
    inorder_rec(@root)
  end

  def inorder_rec(node)
    return [] if node.nil?
    inorder_rec(node.left) + [node.value] + inorder_rec(node.right)
  end
end