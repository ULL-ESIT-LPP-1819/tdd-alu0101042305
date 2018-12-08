class Persona

  include Comparable

  attr_reader :nombre, :sexo

  def initialize(nombre, sexo)
    @nombre,@sexo = nombre,sexo
  end

  def <=> other
    raise TypeError, "Se esperaba un objeto Persona" unless other.is_a?Persona
    return 1 if other.is_a?PacienteM
    return @nombre <=> other.nombre
  end

  def to_s
    "#{@nombre} es un#{@sexo == 'mujer' ? 'a' : nil} #{@sexo}"
  end

end

class Paciente < Persona

  attr_reader :consulta

  def initialize(nombre,sexo,consulta)
    super(nombre,sexo)
    @consulta = consulta
  end

  def to_s
    super.to_s + " con consulta en #{@consulta}"
  end

end

class PacienteM < Paciente

  attr_reader :peso,:talla,:edad,:cintura,:cadera

  def initialize(nombre,sexo,consulta,peso,talla,edad,cintura,cadera)
    super(nombre,sexo,consulta)
    @peso,@talla,@edad,@cintura,@cadera = peso,talla,edad,cintura,cadera
  end

  def addMenu(*labels)
    @menu = labels
  end

  def pesoIdeal
    (talla * 100 - 150) * 0.75 + 50
  end

  def basal
    (10 * peso + 6.25 * talla - 5 * edad + (sexo == 'mujer'? -161 : 5)).round(2)
  end

  def termogeno
    (basal * 0.1).round(2)
  end

  def imc
    @peso/(@talla * @talla)
  end

  def to_s
    super.to_s + " y en tratamiento"
  end

  def <=> other
    raise TypeError, "Se esperaba un objeto Persona" unless other.is_a?Persona
    return self.imc <=> other.imc if other.is_a?PacienteM
    return -1
  end

end
