class Array

  # Insertion sort orders the array to the left of the
  # current index in order.  It takes the current index
  # and scans backwards through the ordered section of the
  # array, looking for the index of the last value larger
  # than itself.  Then it inserts the value at the current
  # index before that value.
  def insertion_sort!
    self.length.times do |idx|
      next if idx == 0
      j = idx

      while j > 0 && self[j-1] >= self[idx]
        j -= 1
      end

      val = self[idx]
      self.delete_at(idx)
      self.insert(j, val)
    end

    return self
  end

  def insertion_sort
    copy = self.dup
    copy.insertion_sort!
  end
end
