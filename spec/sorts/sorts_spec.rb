require 'sorts/sorts'

describe Array do
  let(:input_0)  { [] }
  let(:result_0) { [] }
  let(:input_1)  { [1] }
  let(:result_1) { [1] }
  let(:input_2)  { [2, 1] }
  let(:result_2) { [1, 2] }
  let(:input_3)  { [2, 3, 1] }
  let(:result_3) { [1, 2, 3] }
  let(:input_4)  { [4, 2, 3, 1] }
  let(:result_4) { [1, 2, 3, 4] }
  let(:input_9)  { [8, 1, 5, 7, 2, 6, 9, 4, 3] }
  let(:result_9) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }

  describe "#insertion_sort!" do
    it "sorts the numeric arrays in ascending order" do
      input_0.insertion_sort!
      expect(input_0).to eq result_0
      input_1.insertion_sort!
      expect(input_1).to eq result_1
      input_2.insertion_sort!
      expect(input_2).to eq result_2
      input_3.insertion_sort!
      expect(input_3).to eq result_3
      input_4.insertion_sort!
      expect(input_4).to eq result_4
      input_9.insertion_sort!
      expect(input_9).to eq result_9
    end
  end

  describe "#insertion_sort" do
    it "sorts the numeric arrays in ascending order" do
      expect(input_0.insertion_sort).to eq result_0
      expect(input_1.insertion_sort).to eq result_1
      expect(input_2.insertion_sort).to eq result_2
      expect(input_3.insertion_sort).to eq result_3
      expect(input_4.insertion_sort).to eq result_4
      expect(input_9.insertion_sort).to eq result_9
    end
  end
end
