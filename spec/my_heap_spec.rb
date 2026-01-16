require_relative "../lib/my_heap.rb"

RSpec.describe MyHeap do
  let(:heap) { MyHeap.new }
  
  describe"#shift_up" do
    it "does nothing if heap is already valid" do
      heap.heap.concat([10, 20, 30])
      heap.shift_up(0)
      expect(heap.heap[0]).to eq(10)
    end

    it "moves smaller element to root correctly" do
      heap.heap.concat([10, 20, 5])
      heap.shift_up(2)
      expect(heap.heap[0]).to eq(5)
    end
  end
  
  describe"#shift_down" do
    it "does nothing if heap is already valid" do
      heap.heap.concat([10, 20, 30])
      heap.shift_down(0)
      expect(heap.heap[0]).to eq(10)
    end

    it "moves larger element down correctly" do
      heap.heap.concat([10, 5, 20])
      heap.shift_down(0)
      expect(heap.heap[0]).to eq(5)
    end
  end

  describe "#insert" do
    it "adds element and maintains heap property" do
      heap.heap = [10, 20, 30]
      heap.insert(5)
      expect(heap.heap[0]).to eq(5)
    end
  end

  describe "#extract_min" do
    it "raises an error if heap is empty" do
      expect { heap.extract_min }.to raise_error(ArgumentError)
    end

    it "removes the only element from the heap" do
      heap.heap = [1]
      heap.extract_min
      expect(heap.heap).to eq([])
    end

    it "removes the smallest value from the heap" do
      heap.heap = [1, 5, 10, 15, 20]
      expect(heap.extract_min).to eq(1)
    end
  end

  describe "#insert" do
    it "maintains the min heap property" do
      heap.insert(10)
      heap.insert(5)
      heap.insert(20)
      heap.insert(3)

      expect(min_heap_property?(heap.heap)).to be true
    end
  end
end