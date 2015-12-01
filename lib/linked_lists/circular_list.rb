require 'linked_lists/node'

class LinkedList

  class CircularList
    include Enumerable

    attr_accessor :head, :tail

    def each
      item = self.head
      while item
        yield item
        item = item.next
        break if item == self.head
      end
    end

    def insert(data)
      new_node = Node.new(data)
      if self.head.nil?
        new_node.next = new_node
        self.head     = new_node
        self.tail     = new_node
      else
        new_node.next  = self.head
        self.tail.next = new_node
        self.head      = new_node
      end
    end

    def insert_sorted(data)
      if self.head.nil? || data <= self.head.data
        return insert(data)
      end

      current = self.head
      while current.next != self.head && (current.next.data < data)
        current = current.next
      end

      current.next = Node.new(data, current.next)
      self.tail = current.next if current.next.next == self.head
    end

    def find_value(data)
      self.find { |node| node.data == data }
    end

    def remove(target)
      return nil if self.head.nil?

      if self.head == target
        if self.tail == target
          self.head = nil
          self.tail = nil
          return nil
        end

        self.tail.next = self.head.next
        self.head      = self.head.next
        return target
      end

      previous = self.find do |node|
        node.next == target
      end

      if previous
        if previous.next == self.tail
          self.tail      = previous
          self.tail.next = head
        else
          previous.next = previous.next.next
        end
        return target
      end
    end

  end

end
