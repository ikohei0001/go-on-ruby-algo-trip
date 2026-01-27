require_relative "../lib/quick_sort.rb"

RSpec.describe "#quick_sort!" do
  it "sorts an array in ascending order" do
    expect(quick_sort!([5, 3, 1, 4, 2])).to eq([1, 2, 3, 4, 5])
  end
end
