class Menu

  include Comparable

  def initialize(day,&block)
    @day = day
    @almuerzo = []
    @cena = []
    @desayuno = []
    if block_given?
      instance_eval &block
    end
  end

  def titulo(str)
    @title = str
  end

  def ingesta(h = {})
    @min = h[:min] if h[:min]
    @max = h[:max] if h[:max]
  end

  def desayuno(h = {})
    @desayuno << Label.new(h[:descripcion],h[:gramos],h[:grasas],0,h[:carbohidratos],0,h[:proteinas],
    h[:sal])
  end

  def almuerzo(h = {})
    @almuerzo << Label.new(h[:descripcion],h[:gramos],h[:grasas],0,h[:carbohidratos],0,h[:proteinas],
    h[:sal])
  end

  def cena(h = {})
    @cena << Label.new(h[:descripcion],h[:gramos],h[:grasas],0,h[:carbohidratos],0,h[:proteinas],
    h[:sal])
  end

  def kcal
    (@desayuno.reduce(:+) + @cena.reduce(:+) + @almuerzo.reduce(:+)).round(2)
  end

  def <=> (other)
    self.kcal <=> other.kcal
  end

  def to_s
    table = Table.new
    table << @day
    table << '' << 'grasas' << 'carbohidratos' << 'proteinas' << 'sal' << 'valor energético'
    table << 'Desayuno'
    @desayuno.each do |label|
      table << label.nombre << label.grasas << label.hc << label.protei << label.sal << label.kcal
    end
    table << ''
    table << 'Almuerzo'
    @almuerzo.each do |label|
      table << label.nombre << label.grasas << label.hc << label.protei << label.sal << label.kcal
    end
    table << ''
    table << 'Cena'
    @cena.each do |label|
      table << label.nombre << label.grasas << label.hc << label.protei << label.sal << label.kcal
    end
    table << 'Valor energético total' << self.kcal
    table.to_s
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
