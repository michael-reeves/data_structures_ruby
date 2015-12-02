require 'linked_lists/doubly_linked_list'

describe LinkedList::DoublyLinkedList do

  describe "attributes" do
    it "allows reading and writing of :head" do
      expect(subject.head).to be_nil

      subject.head = 'foo'

      expect(subject.head).to eq 'foo'
    end
  end

  describe "#each" do
    it "iterates over the list" do
      node = LinkedList::DoublyLinkedNode.new(1)
      node.next = node
      node.prev = node

      subject.head = node

      expect{ subject.each{ |n| puts n.data } }.to output("1\n").to_stdout
    end
  end

  it "mixes in Enumerable" do
    node1 = LinkedList::DoublyLinkedNode.new(1)
    node2 = LinkedList::DoublyLinkedNode.new(2, node1)
    node3 = LinkedList::DoublyLinkedNode.new(3, node2, node1)
    node1.prev = node3
    node1.next = node2
    node2.next = node3

    subject.head = node1

    expect(subject.map{ |n| n.data }).to eq [1,2,3]
  end

  describe "#insert" do
    it "inserts a new node at the head" do
      subject.insert(3)

      expect(subject.head.data).to      eq 3
      expect(subject.head.next.data).to eq 3
      expect(subject.head.prev.data).to eq 3

      subject.insert(2)

      expect(subject.head.data).to eq 2

      subject.insert(1)

      expect(subject.head.data).to      eq 1
      expect(subject.head.next.data).to eq 2
      expect(subject.head.prev.data).to eq 3
    end
  end

end
