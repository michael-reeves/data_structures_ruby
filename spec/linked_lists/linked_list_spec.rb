require 'linked_lists/linked_list'

describe LinkedList::Node do

  describe "#initialize" do
    it "requires data" do
      expect {LinkedList::Node.new}.to raise_error(ArgumentError)
      expect {LinkedList::Node.new('foobar')}.not_to raise_error
    end

    it "defaults next to nil" do
      node = LinkedList::Node.new('')
      expect(node.next).to be_nil
    end

    it "allows setting of next" do
      node = LinkedList::Node.new('')
      node2 = LinkedList::Node.new('two', node)

      expect(node2.next).to be node
    end
  end

  describe "attributes" do
    it "allow reading and writing of :data" do
      node = LinkedList::Node.new('')
      expect(node.data).not_to eq 'foobar'

      node.data = 'foobar'
      expect(node.data).to eq 'foobar'
    end

    it "allow reading and writing of :next" do
      node = LinkedList::Node.new("")
      expect(node.next).to be_nil
      node.next = 'dogs'

      expect(node.next).to eq 'dogs'
    end
  end

end

describe LinkedList::List do

  describe "attributes" do
    it "allow reading and writing of :head" do
      subject.head = LinkedList::Node.new(1)

      expect(subject.head).to be_an_instance_of(LinkedList::Node)
    end
  end

  describe "#each" do
    it "can iterate over the list" do
      subject.head = LinkedList::Node.new(1)

      expect { subject.each { |node| puts node.data } }.to output("1\n").to_stdout
    end

    it "inherits from Enumerable" do
      subject.head = LinkedList::Node.new("Hello")
      output = subject.map {|node| "#{node.data}, world!" }

      expect(output).to eq ["Hello, world!"]
    end
  end

  describe "#insert" do
    it "adds a new node to the :head of the list" do
      subject.head = LinkedList::Node.new('cat')
      subject.insert('dog')

      expect(subject.head.data).to eq 'dog'
    end
  end

  describe "#insert_sorted" do
    it "adds a new node in sorted order" do
      list1      = LinkedList::List.new
      list1.head = LinkedList::Node.new('cat')
      list1.insert_sorted('dog')

      expect(list1.head.data).to      eq 'cat'
      expect(list1.head.next.data).to eq 'dog'

      list2 = LinkedList::List.new
      list2.head = LinkedList::Node.new(3)
      list2.insert(1)
      list2.insert_sorted(2)

      expect( list2.map{|n| n.data } ).to eq [1, 2, 3]
    end
  end

  describe "#find_value" do
    it "returns the node containing the value in :data" do
      node = LinkedList::Node.new('cat')
      subject.head = node
      subject.insert('dog')
      subject.insert('mouse')

      expect(subject.find_value('cat')).to eq node
    end
  end

  describe "#remove" do
    it "deletes the target node from the list" do
      subject.head = LinkedList::Node.new('cat')
      subject.insert('dog')
      subject.insert('mouse')

      node = subject.find_value('dog')
      subject.remove(node)

      expect(subject).not_to include(node)
    end

    it "yields an empty list when removing the only node from the list" do
      node = LinkedList::Node.new('cat')
      subject.head = node

      subject.remove(node)

      expect(subject.head).to be_nil
    end

    it "does not raise an error if the list is empty" do
      node = LinkedList::Node.new('cat')

      subject.remove(node)

      expect(subject.head).to be_nil
    end
  end

  describe "#remove_value" do
    it "deletes the first node containing the value from the list" do
      subject.head = LinkedList::Node.new('cat')
      subject.insert('dog')
      subject.insert('cat')
      subject.insert('mouse')

      subject.remove_value('cat')

      expect( subject.map{|node| node.data} ).to eq ['mouse', 'dog', 'cat']
    end

    it "yields an empty list when removing the only node from the list" do
      subject.head = LinkedList::Node.new('cat')

      subject.remove_value('cat')

      expect(subject.head).to be_nil
    end

    it "does not raise an error if the list is empty" do
      subject.remove_value('cat')

      expect(subject.head).to be_nil
    end
  end

end
