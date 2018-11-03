class Label

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

  def toX(method)
    ((send(method)*@porcion)/100).round(2)
  end

  def ir(method)
    ((send(method)*100)/@@ir[method]).round(2)
  end

end
