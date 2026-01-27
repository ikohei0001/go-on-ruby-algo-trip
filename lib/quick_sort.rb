def quick_sort!(arr, left = 0, right = arr.length - 1)
  return if left >= right

  pivot = arr[(left + right) / 2]
  i = left
  j = right

  while i <= j
    i += 1 while i <= j && arr[i] < pivot
    j -= 1 while i <= j && arr[j] > pivot

    if i <= j
      arr[i], arr[j] = arr[j], arr[i]
      i += 1
      j -= 1
    end
  end

  quick_sort!(arr, left, j)
  quick_sort!(arr, i, right)

  arr
end
