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

  describe "#find_value" do
    it "returns the node containing the value" do
      subject.insert(4)
      subject.insert(3)
      subject.insert(2)
      subject.insert(1)

      node = subject.find_value(4)

      expect(node).to      be subject.head.prev
      expect(node.data).to eq 4
    end

    it "returns the first node containing the value" do
      subject.insert(3)
      subject.insert(3)
      subject.insert(1)

      node = subject.find_value(3)

      expect(node.data).to eq 3
      expect(node).not_to  be subject.head.prev
    end

    it "returns nil if the value is not found" do
      subject.insert('foo')

      expect(subject.find_value('bar')).to be_nil
    end
  end

  describe "#remove" do
    it "deletes the target node from the list and returns it" do
      subject.insert('cat')
      subject.insert('dog')
      subject.insert('cat')
      subject.insert('mouse')

      node = subject.find_value('cat')

      expect(subject.remove(node)).to be node
    end

    it "returns nil if the item is not found" do
      subject.insert('cat')
      subject.insert('dog')
      node = LinkedList::DoublyLinkedNode.new('mouse', subject.head, subject.head.prev)

      expect(subject.remove(node)).to be_nil
    end

    it "returns an empty list if the node is the last item in the list" do
      subject.insert('cat')
      node = subject.find_value('cat')

      subject.remove(node)

      expect(subject.head).to be_nil
    end
  end

  describe "#remove_value" do
    it "deletes the first node containing the value from the list" do
      subject.insert('cat')
      subject.insert('dog')
      subject.insert('cat')
      subject.insert('mouse')

      node = subject.remove_value('cat')

      expect( subject.map{ |n| n.data } ).to eq ['mouse', 'dog', 'cat']
      expect(node.data).to eq 'cat'
    end

    it "returns nil if a node containing the value is not found" do
      subject.insert('cat')
      subject.insert('dog')

      expect(subject.remove_value('mouse')).to be_nil
    end
  end

end
