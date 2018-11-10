
Node = Struct.new(:value, :next, :prev)

class List

include Enumerable

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

  def pop(n = 1)
    n.times do
      @tail = @tail.prev
      @tail.next = nil
    end
  end

  def shift(n = 1)
    n.times do
      @head = @head.next
      @head.prev = nil
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

end
