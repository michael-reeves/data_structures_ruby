require 'linked_lists/doubly_linked_node'

# this implementation of a DoublyLinkedList is circular.
# tail.next should always point to the head and
# head.prev should always point to the tail,
# and because of this, head.prev is a standin for tail
class LinkedList

  class DoublyLinkedList
    include Enumerable

    attr_accessor :head

    def each
      item = head
      while item
        yield item
        item = item.next
        break if item == head
      end
    end

    def insert(data)
      if head.nil?
        self.head = DoublyLinkedNode.new(data)
        self.head.prev = head
        self.head.next = head
        return
      end

      node = DoublyLinkedNode.new(data, head.prev, head)
      self.head.prev.next = node  # point the old tail.next to the new node
      self.head.prev      = node  # at this point head is still the old head
                                  # so point head.prev to new node
      self.head           = node  # finally move head to the new node
    end

  end

end
