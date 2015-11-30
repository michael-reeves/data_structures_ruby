class LinkedList
  class Node
    attr_accessor :data, :next

    def initialize(data, next_node = nil)
      self.data = data
      self.next = next_node
    end
  end
end
