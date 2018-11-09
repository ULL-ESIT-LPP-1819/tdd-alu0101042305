
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

  def to_a
    array = []
    node = @head
    while(node != nil)
      array << node.value
      node = node.next
    end
    array
  end

end
