
Node = Struct.new(:value, :next, :prev)

class List

  def <<(val)
    node = Node.new(val)
    if(@head == nil)
      @head = node
      @tail = node
    else
      node.prev = @tail
      @tail.next = node
      @tail = node
    end
    self
  end

  def each
    node = @head
    while(node != nil)
      yield node.value
      node = node.next
    end
  end

  def to_a
    array = []
    self.each do |val|
      array << val
    end
    array
  end

end
