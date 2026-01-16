class MyHeap
  attr_accessor :heap

  def initialize
    @heap = []
  end

  def insert(value)
    @heap << value
    shift_up(@heap.size - 1)
  end

  def extract_min
    raise(ArgumentError, "heap is empty") if @heap.empty? # 要素0の場合

    min_val = @heap[0]
    last_val = @heap.pop
    
    if !@heap.empty? # 要素が2つ以上の場合
      @heap[0] = last_val
      shift_down(0)
    end
    min_val
  end

  def to_a
    @heap
  end

  def shift_up(index)
    parent = (index - 1) / 2 

    if index > 0 && @heap[parent] > @heap[index]
      @heap[parent], @heap[index] = @heap[index], @heap[parent]
      shift_up(parent)
    end
  end

  def shift_down(index)
    left = index * 2 + 1
    right = index * 2 + 2
    smallest = index

    smallest = left if left < @heap.size && @heap[smallest] > @heap[left]
    smallest = right if right < @heap.size && @heap[smallest] > @heap[right]

    if smallest != index
      @heap[smallest], @heap[index] = @heap[index], @heap[smallest]
      shift_down(smallest)
    end
  end
end