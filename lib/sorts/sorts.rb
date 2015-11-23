class Array
  def insertion_sort
    copy = self.dup
    copy.insertion_sort!
  end

  # Insertion sort takes the
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
end
