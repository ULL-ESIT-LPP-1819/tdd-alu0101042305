class Menu < Array

  include Comparable

  def initialize(*labels)
    super(labels)
  end

  def kcal
    (map {|label| label.kcal}.reduce(:+)).round(2)
  end

  def <=> (other)
    self.kcal <=> other.kcal
  end

  def to_s
    map{|label| label.nombre + ' '}.reduce(:+)
  end

  def self.for_sort(menus)
    for i in (0..menus.size-2)
      for j in (i+1..menus.size-1)
        if(menus[i] > menus[j])
           aux = menus[i];
           menus[i] = menus[j];
           menus[j] = aux;
        end
      end
    end
    menus
  end

  def self.each_sort(menus)
    array = Array.new
    menus.each do |menu|
      sz = array.size
      array.each_with_index do |menu2,i|
        array.insert(i,menu) if menu2 > menu and sz == array.size
      end
      array << menu if sz == array.size
    end
    array
  end

end
