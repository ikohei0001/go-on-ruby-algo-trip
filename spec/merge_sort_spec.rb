require_relative "../lib/merge_sort.rb"

RSpec.describe "#sort_array" do
  it "sorts an array in ascending order" do
    expect(sort_array([3, 5, 1, 6, 9, 4, 2, 8, 7])).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end
end
