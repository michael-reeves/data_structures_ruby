class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    self.data = data
    self.next = next_node
  end
end

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
end
