class MyArray
  def initialize
    @data  = {}
    @size = 0
  end
  
  def push(var)
    @data[@size] = var
    @size += 1
  end
  
  def get(index)
    raise(ArgumentError, "存在する配列番号を指定してください") if index < 0 || index >= @size
      
    @data[index]
  end
  
  def []=(index, var)
    raise(ArgumentError, "存在する配列番号を指定してください") if index < 0 || index >= @size
      
    @data[index] = var 
  end
  
  def insert(index, var)
    raise(ArgumentError, "存在する配列番号を指定してください") if index < 0 || index >= @size
      
    i = @size - 1
    while i > index - 1 
      @data[i + 1] = @data[i]
      i = i - 1
    end
    @data[index] = var
    @size += 1
  end
  
  def delete(index)
    raise(ArgumentError, "存在する配列番号を指定してください") if index < 0 || index >= @size
      
    value = @data[index]
    i = index
    while i < @size
      @data[i] = @data[i + 1]
      i = i + 1
    end
    @data[@size - 1] = nil
    @size -= 1
    value
  end
  
  def size
    @size 
  end
  
  def to_a
    (0...@size).map { |i| @data[i] }
  end

  def to_s
    to_a.to_s
  end

  def inspect
    to_a.inspect
  end

  def [](index)
    get(index)
  end
end

def call_myarray_push_with_for_sentence
  array = MyArray.new
  for i in 1..10
    array.push(i)
  end
  array
end

def call_myarray_push_with_times_sentence
  array = MyArray.new 
  10.times do |i|
    array.push(i + 1) # 出力結果を揃えるため、1を可算している
  end
  array
end

def delete_only_even_numbers_from_begining_of_array
  array = call_myarray_push_with_for_sentence
  i = 0
  while i < array.size
    if array[i].even?
      array.delete(i)  # 削除した場合はiを進めない
    else
      i += 1
    end
  end
  array
end

def delete_only_even_numbers_from_end_of_array
  array = call_myarray_push_with_times_sentence
  (array.size - 1).downto(0) { |x| array.delete(x) if array[x].even? }
  array
end

def find_max_value_from_myarray
  array = call_myarray_push_with_for_sentence
  max_value = array[0]
  (1...array.size).each do |x|
    max_value = array[x] if max_value < array[x]
  end
  max_value
end

def find_min_value_from_myarray
  array = call_myarray_push_with_for_sentence
  min_value = array[0]
  (1...array.size).each do |x|
    min_value = array[x] if min_value > array[x]
  end
  min_value
end

def reverse_myarray
  array = call_myarray_push_with_for_sentence
  (0).upto(array.size / 2 -1) { |x|
    opposite_index = array.size - 1 -x
    array[x], array[opposite_index] = array[opposite_index], array[x]}
  array
end