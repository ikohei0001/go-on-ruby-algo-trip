require_relative "../lib/bubble_sort.rb"

RSpec.describe "#bubble_sort!" do
  it "sorts an array in ascending order" do
    expect(bubble_sort!([5, 3, 1, 4, 2])).to eq([1, 2, 3, 4, 5])
  end
end
