require_relative "../lib/my_bst.rb"

RSpec.describe MyBST do
  let(:bst) { MyBST.new }

  describe "#search_rec" do
    it "returns false for a value that doesn't exist" do
      (1..5).each { |x| bst.insert(x) }
      expect(bst.search(10)).to eq(false)
    end

    it "returns true for an exising value" do
        (1..5).each { |x| bst.insert(x) }
        expect(bst.search(5)).to eq(true)
    end
  end

  describe "#insert_rec" do
    it "put new node on root if BST is empty" do
      bst.insert(1)
      expect(bst.root.value).to eq(1)
    end

    it "add new node and keeps BST property" do
        [10, 15, 2, 5].each { |x| bst.insert(x) }
        bst.insert(6)
        expect(bst.inorder).to eq([2, 5, 6, 10, 15])
    end
  end

  describe "#delete_rec" do
    it "returns nil when deleting a value that doesn't exist" do
      expect(bst.delete(10)).to eq(nil)
    end

    it "deletes  a node with one child" do
      [10, 15, 5, 2, 7, 6].each { |x| bst.insert(x) }
      bst.delete(7)
      expect(bst.inorder).to eq([2, 5, 6, 10, 15])
    end

    it "deletes a node with two children" do
      [10, 15, 5, 2, 7, 6].each { |x| bst.insert(x) }
      bst.delete(5)
      expect(bst.inorder).to eq([2, 6, 7, 10, 15])
    end
  end

  describe "#find_min" do
    it "returns the minimum value node" do
      [10, 15, 5, 2, 7, 6].each { |x| bst.insert(x) }
      bst.delete(2)
      expect(bst.inorder).not_to eq(2)
    end
  end

  describe "#inorder_rec" do
    it "returns values in ascending order" do
      [10, 15, 5, 2, 7, 6].each { |x| bst.insert(x) }
      expect(bst.inorder).to eq([2, 5, 6, 7, 10, 15])
    end
  end
end