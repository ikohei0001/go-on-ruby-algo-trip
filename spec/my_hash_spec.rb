require_relative "../lib/my_hash.rb"

RSpec.describe MyHash do
  let(:myh) { MyHash.new }
  
  describe "#hash_key" do
    it "returns the same index for the same value" do
      expect(myh.hash_key("sample")).to eq(myh.hash_key("sample"))
    end
  end

  describe "#[]=" do
    it "stores different values even if they hash to the same index" do
      myh["ab"] = 1
      myh["ba"] = 2

      expect(myh["ab"]).to eq(1)
      expect(myh["ba"]).to eq(2)
    end
  end

  describe "#[]" do
    it "returns the value for an existing key" do
      myh["a"] = 10
      expect(myh["a"]).to eq(10)
    end

    it "returns nil for a non-existent key" do
      expect(myh["nope"]).to be_nil
    end
  end

  describe "#key?" do
    it "returns true for an existing key" do
      myh["a"] = 10

      expect(myh.key?("a")).to be true
    end
    
    it "returns false for a non-existing key" do
      expect(myh.key?("b")).to be false
    end
  end
end