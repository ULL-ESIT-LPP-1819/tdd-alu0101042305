class Label

  attr_reader :nombre, :porcion, :grasas, :grasass, :hc, :azucar, :protei, :sal

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

end
