require_relative "../lib/my_set.rb"

RSpec.describe MySet do
  let(:a) { MySet.new }
  let(:b) { MySet.new }

  before do 
    a.add(1)
    a.add(2)
    b.add(2)
    b.add(3)
  end

  it "calculates union correctly" do
    expect(Set.new(a.to_a) | Set.new(b.to_a)).to eq(Set.new([1, 2, 3]))
  end

  it "calculates intersection corrently" do
    expect(Set.new(a.to_a) & Set.new(b.to_a)).to eq(Set.new([2]))
  end

  it "calculates difference corrently" do
    expect(Set.new(a.to_a) - Set.new(b.to_a)).to eq(Set.new([1]))
  end
  
end