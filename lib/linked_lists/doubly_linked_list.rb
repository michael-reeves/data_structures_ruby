require 'linked_lists/doubly_linked_node'

# this implementation of a DoublyLinkedList is circular.
# tail.next should always point to the head and
# head.prev should always point to the tail
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

  end

end
