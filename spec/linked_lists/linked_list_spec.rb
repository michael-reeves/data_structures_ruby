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

end
