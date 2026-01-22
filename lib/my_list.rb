class MyList
  class Node
    attr_accessor :data, :next 

      def initialize(value)
        @data = value
        @next = nil
      end
  end

  attr_accessor :head

  def initialize(value = nil)
    @head = value.nil? ? nil : Node.new(value)
  end
  
  def push_front(value)
    node = Node.new(value)
    node.next = @head
    @head = node
  end
  
  def pop_front
    raise "List is empty" if @head.nil?
    
    data = @head.data
    @head = @head.next
    data
  end
  
  def each
    cur = @head
    
    while cur
      yield cur.data
      cur = cur.next
    end
  end
  
  def front
    raise "List is empty" if @head.nil?
    
    @head.data 
  end

  def empty?
    @head.nil?
  end
  
  def size
    length = 0
    each { length += 1 }
    length
  end
  
  def push_back(value)
    node = Node.new(value)
    
    if @head.nil?
      @head = node
      return @head.data
    end

    cur = @head
    while cur.next
      cur = cur.next
    end
    
    cur.next = node
  end

  def pop_back
    raise "List is empty" if @head.nil?

    if @head.next.nil?
      data = @head.data
      @head = nil
      return data
    end

    cur = @head
    while cur.next.next
      cur = cur.next
    end

    data = cur.next.data
    cur.next = nil
    data
  end
end