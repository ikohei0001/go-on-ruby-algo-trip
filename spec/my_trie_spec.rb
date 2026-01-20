require_relative "../lib/my_trie.rb"

RSpec.describe MyTrie do
  let(:trie) {MyTrie.new}

  describe "#insert" do
    it "inserts a string into the MyTrie" do
      trie.insert("sample")
      expect(trie.include?("sample")).to be(true)
    end
  end

  describe "#include?" do
    context "returns true" do
      it "for the string containing MyTrie" do
        trie.insert("sample")
        expect(trie.include?("sample")).to be(true)
      end
    end
    
    context "returns false" do
      it "for a string not containing MyTrie" do
        expect(trie.include?("exam")).to be(false)
      end
    end
  end

  describe "#start_with?" do
    context "returns true" do
      it "for the prefix containing MyTrie" do
        trie.insert("sample")
        expect(trie.start_with?("sa")).to be(true)
      end
    end

    context "returns false" do
      it "for a prefix not containing MyTrie" do
        trie.insert("sample")
        expect(trie.start_with?("sb")).to be(false)
      end
    end
  end

  describe "#words" do
    it "returns all the string containing the MyTrie" do
      ["one", "two", "three"].each { |x| trie.insert(x) }
      expect(trie.words).to match_array(["one", "two", "three"])
    end

    it "returns empty array when trie is empty" do
      expect(trie.words).to eq([])
    end
  end

  describe "#delete" do
    it "does not remove other words with same prefix" do
      trie.insert("car")
      trie.insert("cat")
      trie.delete("car")

      expect(trie.include?("cat")).to be(true)
      expect(trie.include?("car")).to be(false)
    end
  end
end