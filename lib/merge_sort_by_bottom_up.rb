# 再帰を使わず、ボトムアップ方式で配列をマージソート
def merge_sort_by_bottom_up(arr)
  n = arr.length
  buffer = Array.new(n)
  width = 1

  while width < n
    i = 0

    while i < n
      left = i
      mid = [i + width, n].min
      right = [i + width * 2, n].min

      merge_range(arr, buffer, left, mid, right)
      i += width * 2
    end

    arr, buffer = buffer, arr
    width *=2
  end

  arr
end

# ソート済み配列を、bufferにマージして書き込む
def merge_range(arr, buffer, left, mid, right)
  i = left
  j = mid
  k = left
  
  while i < mid && j < right
    if arr[i] <= arr[j]
      buffer[k] = arr[i]
      i += 1
    else
      buffer[k] = arr[j]
      j += 1
    end
    k += 1
  end

  while i < mid
    buffer[k] = arr[i]
    i += 1
    k += 1
  end

  while j < right
    buffer[k] = arr[j]
    j += 1
    k += 1
  end
end

# ボトムアップ版マージソートのラッパーメソッド
def sort_array(arr)
  merge_sort_by_bottom_up(arr)
end
