require 'linked_lists/doubly_linked_node'

describe LinkedList::DoublyLinkedNode do

  let(:dl_node) { LinkedList::DoublyLinkedNode.new('foo') }

  describe "#initialize" do
    it "requires at data" do
      expect { LinkedList::DoublyLinkedNode.new() }.to raise_error(ArgumentError)
      expect { LinkedList::DoublyLinkedNode.new('foobar') }.not_to raise_error
    end

    it "defaults :prev to nil" do
      expect(dl_node.prev).to be_nil
    end

    it "allows setting of prev" do
      dl_node1 = LinkedList::DoublyLinkedNode.new('bar', dl_node)

      expect(dl_node1.prev).to eq dl_node
    end

    it "defaults next to nil" do
      expect(dl_node.next).to be_nil
    end

    it "allows setting of next" do
      dl_node1 = LinkedList::DoublyLinkedNode.new('bar', nil, dl_node)

      expect(dl_node1.next).to eq dl_node
    end
  end

  describe "attributes" do
    it "allows reading and writing of :data" do
      expect(dl_node.data).to eq 'foo'

      dl_node.data = 'cow'

      expect(dl_node.data).to eq 'cow'
    end

    it "allows reading and writing of :prev" do
      expect(dl_node.prev).to be_nil

      node1 = LinkedList::DoublyLinkedNode.new('bar')
      dl_node.prev = node1

      expect(dl_node.prev).to eq node1
    end

    it "allows reading and writing of :next" do
      expect(dl_node.next).to be_nil

      node1 = LinkedList::DoublyLinkedNode.new('bar')
      dl_node.next = node1

      expect(dl_node.next).to eq node1
    end
  end

end
