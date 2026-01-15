require_relative "../lib/my_list.rb"

RSpec.describe MyList do
  let(:test_case) { MyList.new("one") }

  describe "#push_front" do
    context "when list has existing nodes" do
      it "adds a new node and links it to previous head" do
        old_head = test_case.head
        new_head = test_case.push_front("two")
        expect(test_case.head).to eq(new_head)
        expect(new_head.next).to eq(old_head)
      end
    end
    context "when list is empty" do
      it "adds a new head node" do
        list = MyList.new()
        new_node = list.push_front("one")
        expect(list.head).to eq(new_node)
        expect(new_node.next).to be_nil
      end 
    end
  end
  
  describe "#pop_front" do
    context "when list has existing nodes" do
      it "removes the head node and updates the head to the next node" do
        next_node = test_case.head.next
        test_case.pop_front
        expect(test_case.head).to eq(next_node)
      end
    end
    context "when list is empty" do
      it "raises an error" do
        list = MyList.new()
        expect { list.pop_front }.to raise_error(RuntimeError)
      end 
    end
  end      
  
  describe "#front" do
    context "when list has existing nodes" do
      it "returns the value of the head node" do
        expect(test_case.front).to eq(test_case.head.data)
      end
    end
    context "when list is empty" do
      it "raises an error" do
        list = MyList.new
        expect { list.front }.to raise_error(RuntimeError)
      end 
    end
  end
  
  describe "#empty?" do
    context "when list has existing nodes" do
      it "returns false" do
        expect(test_case.empty?).to eq(false)
      end
    end
    context "when list is empty" do
      it "returns true" do
        list = MyList.new
        expect(list.empty?).to eq(true)
      end
    end
  end
  
  describe "#each" do
    it "yields each node's data in order" do
      test_case.push_front("two")
      result = []
      test_case.each { |x| result << x }
      expect(result).to eq(["two", "one"])
    end
  end
  
  
  describe "#size" do
    context "when list has existing nodes" do 
      it "returns the number of nodes in the list" do
        test_case.push_front("two")
        expect(test_case.size).to eq(2)
      end
    end
  
    context "when list is empty" do
      it "returns 0" do
        list = MyList.new
        expect(list.size).to eq(0)
      end
    end
  end
  
  describe "#push_back" do
    context "when list is empty" do
      it "adds a new node as the head of the list" do
        list = MyList.new
        new_node = list.push_back("two")
        expect(list.head.data).to eq("two")
      end
    end

    context "when list has existing nodes" do
      it "adds a new node to the end of the list" do
        new_node = test_case.push_back("two")
        cur = test_case.head
        cur = cur.next while cur.next
        expect(cur.data).to eq("two")
      end
    end
  end
  
  describe "#pop_back" do
    context "when list is empty" do
      it "raise an error" do
        list = MyList.new
        expect { list.pop_back }.to raise_error(RuntimeError)
      end
    end

    context "when list has one node" do
      it "removes the only node and makes the list empty" do
        test_case.pop_back
        expect(test_case.head).to eq(nil)
      end
    end
    
    context "when list has some nodes" do
      it "removes the end of node and makes the previous the end of list" do
        test_case.push_back("two")
        test_case.pop_back
        cur = test_case.head
        cur = cur.next while cur.next
        expect(cur.data).to eq("one")
        expect(cur.next).to be_nil
      end
    end
  end
end