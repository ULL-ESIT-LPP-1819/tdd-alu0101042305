
Node = Struct.new(:value, :next, :prev)

class List

include Enumerable

  def initialize
    @sz = 0
  end

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
    @sz += 1
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
    @sz -= 1
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
    @sz += 1
  end

  def pop(n = 1)
    n.times do
      if(@tail != nil)
        @tail = @tail.prev
        @tail.next = nil
      end
    end
    @head = nil if @tail == nil
    @sz -= 1
  end

  def shift(n = 1)
    n.times do
      if @head != nil
        @head = @head.next
        @head.prev = nil
      end
    end
    @tail = nil if @head == nil
    @sz -= 1
  end

  def empty?
    @head == nil
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

  def for_sort
    array = self.to_a
    for i in (0..array.size-2)
      for j in (i+1..array.size-1)
        if(array[i].total > array[j].total)
           aux = array[i]
           array[i] = array[j]
           array[j] = aux
        end
      end
    end
    array
  end

end
