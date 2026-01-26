# 配列を再帰的に分割し、マージソートで昇順に並び替え
def merge_sort(arr)
  return arr if arr.length <= 1

  middle = arr.length / 2
  left = merge_sort(arr[0...middle])
  right = merge_sort(arr[middle...arr.length])

  merge(left, right)
end

# 2つのソート済み配列を、1つのソート済み配列に統合
def merge(left, right)
  result = []
  i = 0
  j = 0

  while i < left.length && j < right.length
    if left[i] <= right[j]
      result << left[i]
      i += 1
   else
      result << right[j]
      j += 1
    end
  end
  
  result.concat(left[i..])
  result.concat(right[j..])

  result
end

# 配列をマージソートして返すラッパーメソッド
def sort_array(arr)
  merge_sort(arr)
end
