class Label

  attr_reader :nombre, :porcion, :grasas, :grasass, :hc, :azucar, :protei, :sal

  def initialize(nombre, porcion, grasas, grasass, hc, azucar, protei, sal)
    @nombre, @porcion, @grasas, @grasass, @hc, @azucar, @protei, @sal =
    nombre, porcion, grasas, grasass, hc, azucar, protei, sal
  end
end
