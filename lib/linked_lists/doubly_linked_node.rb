class LinkedList
  class DoublyLinkedNode
    attr_accessor :data, :prev, :next

    def initialize(data, prev_node = nil, next_node = nil)
      @data = data
      @prev = prev_node
      @next = next_node
    end
  end
end
