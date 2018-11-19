class Persona

  attr_reader :nombre, :sexo

  def initialize(nombre, sexo)
    @nombre,@sexo = nombre,sexo
  end

end

class Paciente < Persona

  attr_reader :consulta

  def initialize(nombre,sexo,consulta)
    super(nombre,sexo)
    @consulta = consulta
  end

end

class PacienteM < Paciente

  attr_reader :peso,:talla,:edad,:cintura,:cadera

  def initialize(nombre,sexo,consulta,peso,talla,edad,cintura,cadera)
    super(nombre,sexo,consulta)
    @peso,@talla,@edad,@cintura,@cadera = peso,talla,edad,cintura,cadera
  end

  def imc
    @peso/(@talla * @talla)
  end

end
