module MinHeapProperty
  def min_heap_property?(arr)
    arr.each_with_index.all? do |val, i|
      left = 2*i + 1
      right = 2*i + 2
      (left >= arr.size || val <= arr[left]) &&
      (right >= arr.size || val <= arr[right])
    end
  end
end