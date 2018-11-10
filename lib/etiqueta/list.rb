
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

  def unshift(val)
    node = Node.new(val)
    if(@head == nil)
      @head == node
      @tail == node
    else
      node.next = @head
      @head.prev = node
      @head = node
    end
  end

  def insert(pos, *arg)
    node = @head
    pos.times do
      if node != nil
        node = node.next
      end
    end
    if node == @head
      self.unshift arg[0]
      self.insert(1, *arg[1, arg.size - 1])
    else
      arg.each do |item|
        if node == nil
          self << item
        else
          newNode = Node.new(item)
          newNode.prev = node.prev
          node.prev.next = newNode
          newNode.next = node
          node.prev = newNode
        end
      end
    end
  end

  def each
    node = @head
    while(node != nil)
      yield node.value
      node = node.next
    end
  end

  def reverse_each
    node = @tail
    while(node != nil)
      yield node.value
      node = node.prev
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
