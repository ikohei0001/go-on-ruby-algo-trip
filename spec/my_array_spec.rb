require_relative "../lib/my_array.rb"

RSpec.describe MyArray do
  describe "#push" do
    it "push a value into the array" do
      array = MyArray.new()
      array.push(1)
      expect(array.get(0)).to eq(1)
      expect(array.size).to eq(1)
    end

    it "push some values into the array" do
      array = MyArray.new()
      array.push(1, 2, 3)
      expect(array.get(0)).to eq(1)
      expect(array.get(1)).to eq(2)
      expect(array.get(2)).to eq(3)
      expect(array.size).to eq(3)
    end
  end

  describe "#get" do
    context "with valid index" do
      it "returns the value for the index number" do
        array = MyArray.new()
        array.push(10)
        expect(array.get(0)).to eq(10)
      end
    end

    context "with invalid index" do
      it "raise an error when the index is invalid" do
        array = MyArray.new()
        array.push(10)
        expect { array.get(-1) }.to raise_error(ArgumentError)
        expect { array.get(2) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#[]=" do
    context "with valid index" do
      it "replaces a value containing an array into variable number" do
        array = MyArray.new()
        array.push(1)
        array.push(2)
        array.push(3)
        array[1] = 10
        expect(array.size).to eq(3)
        expect(array.get(1)).to eq(10)
      end
    end

    context "with invalid index" do
      it "replaces the value at the specified index" do
        array = MyArray.new()
        array.push(10)
        expect { array[-1] = 10 }.to raise_error(ArgumentError)
        expect { array[2] = 10 }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#insert" do
    context "with valid index" do
      it "inserts some values at the specified index" do
        array = MyArray.new()
        array.push(1, 2)
        array.insert(1, 10, 11)
        expect(array.size).to eq(4)
        expect(array.get(0)).to eq(1)
        expect(array.get(1)).to eq(10)
        expect(array.get(2)).to eq(11)
        expect(array.get(3)).to eq(2)
      end
    end

    context "with invalid index" do
      it "raise an error when the index is invalid" do
        array = MyArray.new()
        array.push(1)
        array.push(2)
        expect { array.insert(-1, 10) }.to raise_error(ArgumentError)
        expect { array.insert(10, 5) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#delete" do
    context "with valid index" do
      it "deletes the value at the specified index" do
        array = MyArray.new()
        array.push(1)
        array.push(2)
        array.push(3)
        array.delete(1)
        expect(array.size).to eq(2)
        expect(array.get(0)).to eq(1)
        expect(array.get(1)).to eq(3)
      end
    end

    context "with invalid index" do
      it "raise an error when the index is invalid" do
        array = MyArray.new()
        array.push(10)
        expect { array.delete(-1) }.to raise_error(ArgumentError)
        expect { array.delete(2) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#to_a"do
    it "returns array representation" do
      array = MyArray.new()
      array.push(1)
      array.push(2)
      expect(array.to_a).to eq([1, 2])
    end
  end

  describe "push 10 valuews into myarray" do
    context "#call_myarray_push_with_for_sentence" do
        it "pushes 1..10 correctly" do
        array = call_myarray_push_with_for_sentence

        expect(array.size).to eq(10)
        expect(array.to_a).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        end
    end

    context "#call_myarray_push_with_times_sentence" do
        it "pushes 1..10 correctly" do
        array = call_myarray_push_with_for_sentence

        expect(array.size).to eq(10)
        expect(array.to_a).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        end
    end
  end

  describe "delete only even numbers from array" do
    context "#delete_only_even_numbers_from_begining_of_array" do
      it "deletes only even numbers from array" do
        array = delete_only_even_numbers_from_begining_of_array

        expect(array.to_a).to eq([1, 3, 5, 7, 9])
      end
    end

    context "#delete_only_even_numbers_from_end_of_array" do
      it "deletes only even numbers from array" do
        array = delete_only_even_numbers_from_end_of_array

        expect(array.to_a).to eq([1, 3, 5, 7, 9])
      end
    end
  end

  describe "find max or min value from myarray" do
    context "#find_max_value_from_myarray" do
      it "find_max_value_from_myarray" do
        expect(find_max_value_from_myarray).to eq(10)
      end
    end

    context "#find_min_value_from_myarray" do
      it "find_min_value_from_myarray" do
        expect(find_min_value_from_myarray).to eq(1)
      end
    end
  end

  describe "#reverse_myarray" do
    it "reverses myarray correctly" do
        array = reverse_myarray

        expect(array.to_a).to eq([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
    end
  end
end


