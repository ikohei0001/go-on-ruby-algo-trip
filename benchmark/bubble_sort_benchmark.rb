require "benchmark"
require_relative "../lib/bubble_sort.rb"

arr_asce = (1..10_000).to_a
arr_desc = (1..10_000).to_a.reverse
arr_rand = (1..10_000).to_a.shuffle

Benchmark.bmbm do |x|
  x.report("best case:   ") { bubble_sort!(arr_asce.dup) }
  x.report("worst case:  ") { bubble_sort!(arr_desc.dup) }
  x.report("average case:") { bubble_sort!(arr_rand.dup) }
end
