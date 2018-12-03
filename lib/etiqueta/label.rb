class Label

  include Comparable

  attr_reader :nombre, :porcion, :grasas, :grasass, :hc, :azucar, :protei, :sal

  @@ir = {:kj => 8400, :kcal => 2000, :grasas => 70, :grasass => 20,
     :hc => 260, :azucar => 90, :protei => 50, :sal => 6}

  def initialize(nombre, porcion, grasas, grasass, hc, azucar, protei, sal)
    @nombre, @porcion, @grasas, @grasass, @hc, @azucar, @protei, @sal =
    nombre, porcion, grasas, grasass, hc, azucar, protei, sal
  end

  def kj
    grasas * 37 + hc * 17 + protei * 17 + sal * 25
  end

  def kcal
    grasas * 9 + hc * 4 + protei * 4 + sal * 6
  end

  def toX(method, arg = nil)
    if arg == nil
      ((send(method)*@porcion)/100).round(2)
    else
      ((send(method, arg)*@porcion)/100).round(2)
    end
  end

  def ir(method)
    ((send(method)*100)/@@ir[method]).round(2)
  end

  def <=>(label)
    return -1 if self.sal < label.sal
    return 1 if self.sal > label.sal
    return self.nombre <=> label.nombre
  end

  def to_s
    str = String.new
    str << @nombre << "\n"
    str << "\t\t\t Por 100g\t IR (100g)\t Por #{@porcion}g\t IR(#{@porcion}g)\n"
    str << "Valor energético\t #{kj}kJ/#{kcal}kcal\t #{ir(:kcal)}%\t #{toX(:kj)}kJ/#{toX(:kcal)}kcal\t #{toX(:ir,:kcal)}%\n"
    str <<"Grasas\t\t\t #{@grasas}g\t\t #{ir(:grasas)}%\t\t  #{toX(:grasas)}g\t\t  #{toX(:ir,:grasas)}%\n"
    str <<"  saturadas:\t\t #{@grasass}g\t\t #{ir(:grasass)}%\t\t  #{toX(:grasass)}g\t\t  #{toX(:ir,:grasass)}%\n"
    str <<"Hidratos de carbono\t #{@hc}g\t\t #{ir(:hc)}%\t\t  #{toX(:hc)}g\t\t  #{toX(:ir,:hc)}%\n"
    str <<"  azúcares:\t\t #{@azucar}g\t\t #{ir(:azucar)}%\t\t  #{toX(:azucar)}g\t\t  #{toX(:ir,:azucar)}%\n"
    str <<"Proteínas\t\t #{@protei}g\t\t #{ir(:protei)}%\t\t  #{toX(:protei)}g\t\t  #{toX(:ir,:protei)}%\n"
    str <<"Sal\t\t\t #{@sal}g\t\t #{ir(:sal)}%\t\t  #{toX(:sal)}g\t\t  #{toX(:ir,:sal)}%\n"
  end

end
