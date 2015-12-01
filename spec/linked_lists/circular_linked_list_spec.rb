require 'linked_lists/circular_list'

describe LinkedList::CircularList do

  describe "attributes" do
    it "allows reading and writing of :head" do
      list = LinkedList::CircularList.new

      expect(list.head).to be_nil

      list.head = LinkedList::Node.new('cat')
      expect(list.head).to be_a_kind_of(LinkedList::Node)
      expect(list.head.data).to eq 'cat'
    end

    it "allows reading and writing of :tail" do
      list = LinkedList::CircularList.new

      expect(list.tail).to be_nil

      list.tail = LinkedList::Node.new('cat')
      expect(list.tail).to be_a_kind_of(LinkedList::Node)
      expect(list.tail.data).to eq 'cat'
    end
  end

  describe "#each" do
    it "can iterate over a list" do
      subject.head = LinkedList::Node.new(1)

      expect { subject.each { |node| puts node.data } }.to output("1\n").to_stdout
    end
  end

  it "inherits from Enumerable" do
    subject.head = LinkedList::Node.new('Hello')

    output = subject.map {|node| "#{node.data}, world!"}

    expect(output).to eq ["Hello, world!"]
  end

  describe "#insert" do
    it "adds a new node to the head of the list" do
      subject.insert('cat')
      subject.insert('monkey')
      subject.insert('dog')

      expect(subject.head).to be_a_kind_of(LinkedList::Node)
      expect(subject.head.data).to eq 'dog'
    end
  end

  describe "#insert_sorted" do
    it "adds a new node to the list in sorted order" do
      list1 = LinkedList::CircularList.new
      list1.insert_sorted('dog')
      list1.insert_sorted('cat')
      list1.insert_sorted('mouse')

      expect(list1.head.data).to eq 'cat'
      expect(list1.head.next.data).to eq 'dog'
      expect(list1.head.next.next.data).to eq 'mouse'

      list2 = LinkedList::CircularList.new
      list2.insert_sorted(3)
      list2.insert_sorted(1)
      list2.insert_sorted(4)
      list2.insert_sorted(2)

      expect( list2.map { |node| node.data } ).to eq [1, 2, 3, 4]
    end
  end

  describe "#find_value" do
    it "returns the first node containing the value in data" do
      subject.insert('dog')
      subject.insert('cat')
      subject.insert('monkey')
      subject.insert('monkey')

      expect(subject.find_value('monkey')).to eq subject.head
    end
  end

  describe "#remove" do
    before do
      subject.insert('dog')
      subject.insert('cat')
      subject.insert('cat')
      subject.insert('monkey')
    end

    it "deletes the targeted node from the list" do
      expect(subject.map {|node| node.data }).to eq ['monkey', 'cat', 'cat', 'dog']

      cat_node = subject.find_value('cat')
      expect(subject.remove(cat_node)).to equal cat_node

      expect(subject.map{|node| node.data }).to eq ['monkey', 'cat', 'dog']

    end

    it "deletes the target node from the tail" do
      dog_node = subject.tail
      subject.remove(dog_node)

      expect(subject.map{|node| node.data}).to eq ['monkey', 'cat', 'cat']
    end

    it "deletes the target node from the head" do
      monkey_node = subject.find_value('monkey')
      subject.remove(monkey_node)

      expect(subject.map{|node| node.data}).to eq ['cat', 'cat', 'dog']
    end

    it "return nil if the node is not found" do
      monkey_node = LinkedList::Node.new('monkey')
      expect( subject.remove(monkey_node) ).to be_nil
    end

    it "sets :head and :tail to nil when removing a single element" do
      list1 = LinkedList::CircularList.new
      node = list1.insert('cat')

      expect(list1.remove(node)).to be_nil
      expect(list1.head).to         be_nil
      expect(list1.tail).to         be_nil
    end
  end

end
