class Menu < Array

  def initialize(*labels)
    super(labels)
  end

  def kcal
    (map {|label| label.kcal}.reduce(:+)).round(2)
  end

end
