require 'linked_lists/node'

class LinkedList
  class List
    include Enumerable

    attr_accessor :head

    def each
      item = self.head
      while item
        yield(item)
        item = item.next
      end
    end

    def insert(data)
      self.head = Node.new(data, self.head)
    end

    def insert_sorted(data)
      if (!head || data <= head.data)
        return insert(data)
      end

      current = head
      while current.next && (current.next.data < data)
        current = current.next
      end

      current.next = Node.new(data, current.next)
    end

    def find_value(value)
      # leverage find in the Enumerable module
      self.find do |node|
        node.data == value
      end
    end

    def remove(target)
      self.head = head.next if head == target

      previous = find do |node|
        node.next == target
      end

      previous.next = previous.next.next if previous
    end

    def remove_value(value)
      self.head = head.next if head && head.data == value

      previous = self.find do |node|
        node.next.data == value
      end

      previous.next = previous.next.next if previous

      # this would be cleaner but requires 2 iterations over the list
      # target = self.find_value(value)
      # self.remove(target)
    end
  end
end
