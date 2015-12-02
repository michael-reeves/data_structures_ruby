require 'linked_lists/doubly_linked_list'

describe LinkedList::DoublyLinkedList do

  describe "attributes" do
    it "allows reading and writing of :head" do
      expect(subject.head).to be_nil

      subject.head = 'foo'

      expect(subject.head).to eq 'foo'
    end
  end

end
