class Row < Array

  @@cols = []

  def << parm
    arg = parm.to_s
    if(@@cols[size])
      @@cols[size] = arg.size if arg.size > @@cols[size]
    else
      @@cols[size] = arg.size
    end
    super arg
  end

  def to_s
    str = String.new
    self.each_with_index do |cell,i|
      str << cell + (' ' * (@@cols[i] - cell.size + 1))
    end
    str + "\n"
  end

end

class Table

  def initialize
    @rows = []
  end

  def << arg
    row = Row.new
    @rows << row
    row << arg
  end

  def to_s
    str = String.new
    @rows.each do |row|
      str << row.to_s
    end
    str
  end

end
