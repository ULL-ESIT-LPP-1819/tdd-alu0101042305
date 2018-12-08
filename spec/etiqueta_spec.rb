RSpec.describe Etiqueta do

  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  describe 'Menú dietético' do

    before :all do
      @persona1 = PacienteM.new('Ana','mujer','Hospital de Guadalupe',65.3,1.75,32,67.0,70.0,'moderada')
      @persona2 = PacienteM.new('Marta','mujer','Hospital de Guadalupe',83.0,1.71,64,80.0,90.0,'ninguna')
      @persona3 = PacienteM.new('Juan','hombre','Hospital de los Dolores',67.0,1.72,28,70.0,80.0,'ligera')
      @persona4 = PacienteM.new('Maria','mujer','Hospital de la Candelaria',45.0,1.39,12,40.0,47.0,'ligera')
      @persona5 = PacienteM.new('Carlos','hombre','Hospital del Carmen',70.0,1.69,45,80.0,81.0,'intensa')
      @list1 = List.new << @persona1 << @persona2 << @persona3 << @persona4 << @persona5

      @ensalada = Label.new('Ensalada',    40.0,     20.0,     9.8,  69.0,  38.0,    5.0,   0.9)
      @carne = Label.new('Carne',    30.0,     35.1,     4.6,  47.7,  0.6,     6.3,   1.3)

      @persona1.addMenu(@ensalada,@ensalada,@ensalada)
      @persona2.addMenu(@ensalada,@ensalada,@carne)
      @persona3.addMenu(@ensalada,@carne,@carne)
      @persona4.addMenu(@carne,@carne,@carne)
      @persona5.addMenu(@ensalada,@ensalada,@carne)
    end

    it 'Peso ideal' do
      expect(@persona1.pesoIdeal).to eq(68.75)
      expect(@persona2.pesoIdeal).to eq(65.75)
      expect(@persona3.pesoIdeal).to eq(66.5)
      expect(@persona4.pesoIdeal).to eq(41.75)
      expect(@persona5.pesoIdeal).to eq(64.25)
    end

    it 'Gasto energético basal' do
      expect(@persona1.basal).to eq(342.94)
      expect(@persona2.basal).to eq(359.69)
      expect(@persona3.basal).to eq(545.75)
      expect(@persona4.basal).to eq(237.69)
      expect(@persona5.basal).to eq(490.56)
    end

    it 'Efecto termógeno' do
      expect(@persona1.termogeno).to eq(34.29)
      expect(@persona2.termogeno).to eq(35.97)
      expect(@persona3.termogeno).to eq(54.58)
      expect(@persona4.termogeno).to eq(23.77)
      expect(@persona5.termogeno).to eq(49.06)
    end

    it 'Gasto de actividad física' do
      expect(@persona1.actividad).to eq(92.59)
      expect(@persona2.actividad).to eq(0)
      expect(@persona3.actividad).to eq(65.49)
      expect(@persona4.actividad).to eq(28.52)
      expect(@persona5.actividad).to eq(264.9)
    end

  end

  describe Enumerable do

    before :all do
      @persona1 = Persona.new('Ana','mujer')
      @persona2 = Paciente.new('Marta','mujer','Hospital de Guadalupe')
      @persona3 = PacienteM.new('Juan','hombre','Hospital de los Dolores',67.0,1.72,28,70.0,80.0)
      @persona4 = PacienteM.new('Maria','mujer','Hospital de la Candelaria',45.0,1.39,12,40.0,47.0)
      @persona5 = PacienteM.new('Carlos','hombre','Hospital del Carmen',70.0,1.69,45,80.0,81.0)
      @list1 = List.new << @persona1 << @persona2 << @persona3 << @persona4 << @persona5

      @label1 = Label.new('OREO',    40.0,     20.0,     9.8,  69.0,  38.0,    5.0,   0.9)
      @label2 = Label.new('Lays',    30.0,     35.1,     4.6,  47.7,  0.6,     6.3,   1.3)
      @label3 = Label.new('Mikado',  25.0,     19.0,     12.0, 68.0,  35.0,    6.8,   0.81)
      @label4 = Label.new('Chip ahoy',    23.0,     26.0,     14.0,  61.0,  37.0,    4.5,   1.05)
      @label5 = Label.new('Nestea',    330.0,     0.0,     0.0,  7.7,  7.7,    0.0,   0.04)
      @list2 = List.new << @label1 << @label2 << @label3 << @label4 << @label5
    end

    it 'Método collect' do
      array_sal = @list2.collect {|label| label.sal}
      expect(array_sal).to eq([0.9, 1.3, 0.81, 1.05, 0.04])

      array_nombres = @list1.collect {|persona| persona.nombre}
      expect(array_nombres).to eq(['Ana', 'Marta', 'Juan', 'Maria', 'Carlos'])
    end

    it 'Método select' do
      array_pacientesM = @list1.select {|persona| persona.instance_of?PacienteM}
      expect(array_pacientesM).to eq([@persona3, @persona4, @persona5])

      array_sal = @list2.select {|label| label.sal > 1}
      expect(array_sal).to eq([@label2, @label4])
    end

    it 'Método max' do
      expect(@list1.max).to eq(@persona2)
      expect(@list2.max).to eq(@label2)
    end

    it 'Método min' do
      expect(@list1.min).to eq(@persona3)
      expect(@list2.min).to eq(@label5)
    end

    it "Método sort" do
      expect(@list1.sort).to eq([@persona3,@persona4,@persona5,@persona1,@persona2])
      expect(@list2.sort).to eq([@label5 ,@label3 ,@label1 ,@label4 ,@label2])
    end

  end

  describe Comparable do

    before :all do
      @persona1 = PacienteM.new('Maria','mujer','Hospital de la Candelaria',45.0,1.39,12,40.0,47.0)
      @persona2 = PacienteM.new('Carlos','hombre','Hospital del Carmen',70.0,1.69,45,80.0,81.0)
      @label1 = Label.new('OREO',    40.0,     20.0,     9.8,  69.0,  38.0,    5.0,   0.9)
      @label2 = Label.new('Lays',    30.0,     35.1,     4.6,  47.7,  0.6,     6.3,   1.3)
    end

    it 'Operador ==' do
      expect(@persona1 == @persona2).to eq(false)
      expect(@persona1 == @persona1).to eq(true)

      expect(@label1 == @label2).to eq(false)
      expect(@label1 == @label1).to eq(true)
    end

    it 'Operador !=' do
      expect(@persona1 != @persona2).to eq(true)
      expect(@persona2 != @persona2).to eq(false)

      expect(@label1 != @label2).to eq(true)
      expect(@label2 != @label2).to eq(false)
    end

    it 'Operador <' do
      expect(@persona1 < @persona2).to eq(true)
      expect(@persona2 < @persona1).to eq(false)
      expect(@persona1 < @persona1).to eq(false)

      expect(@label1 < @label2).to eq(true)
      expect(@label2 < @label1).to eq(false)
      expect(@label1 < @label1).to eq(false)
    end

    it 'Operador <=' do
      expect(@persona1 <= @persona1).to eq(true)
      expect(@persona1 <= @persona2).to eq(true)

      expect(@label1 <= @label1).to eq(true)
      expect(@label1 <= @label2).to eq(true)
    end

    it 'Operador >' do
      expect(@persona1 > @persona1).to eq(false)
      expect(@persona2 > @persona1).to eq(true)

      expect(@label1 > @label1).to eq(false)
      expect(@label2 > @label1).to eq(true)
    end

    it 'Operador >=' do
      expect(@persona1 >= @persona1).to eq(true)
      expect(@persona1 >= @persona2).to eq(false)

      expect(@label1 >= @label1).to eq(true)
      expect(@label1 >= @label2).to eq(false)
    end

  end

  describe PacienteM do

    before :all do
      @persona1 = Persona.new('Ana','mujer')
      @persona2 = Paciente.new('Marta','mujer','Hospital de Guadalupe')
      @persona3 = PacienteM.new('Juan','hombre','Hospital de los Dolores',67.0,1.72,28,70.0,80.0)
      @persona4 = PacienteM.new('Maria','mujer','Hospital de la Candelaria',45.0,1.39,12,40.0,47.0)
      @persona5 = PacienteM.new('Carlos','hombre','Hospital del Carmen',70.0,1.69,45,80.0,81.0)
      @list = List.new << @persona1 << @persona2 << @persona3 << @persona4 << @persona5
    end

    it 'Comprobando clases' do
      expect(@persona1.class).to eq(Persona)
      expect(@persona2.class).to eq(Paciente)
      expect(@persona3.class).to eq(PacienteM)
      expect(@persona4.class).to eq(PacienteM)
      expect(@persona5.class).to eq(PacienteM)
    end

    it 'Comprobando jerarquía' do
      @list.each do |persona|
        expect(persona.is_a?Persona).to eq(true)
      end
    end

    it 'Ordenando por masa corporal' do
      orderedArray = @list.sort
      expect(orderedArray).to eq([@persona3,@persona4,@persona5,@persona1,@persona2])
    end

    it 'Método to_s' do
      expect(@persona1.to_s).to eq('Ana es una mujer')
      expect(@persona2.to_s).to eq('Marta es una mujer con consulta en Hospital de Guadalupe')
      expect(@persona5.to_s).to eq('Carlos es un hombre con consulta en Hospital del Carmen y en tratamiento')
    end

  end

  describe List do

    before :all do
      @label1 = Label.new('OREO',    40.0,     20.0,     9.8,  69.0,  38.0,    5.0,   0.9)
      @label2 = Label.new('Lays',    30.0,     35.1,     4.6,  47.7,  0.6,     6.3,   1.3)
      @label3 = Label.new('Mikado',  25.0,     19.0,     12.0, 68.0,  35.0,    6.8,   0.81)
      @label4 = Label.new('Chip ahoy',    23.0,     26.0,     14.0,  61.0,  37.0,    4.5,   1.05)
      @label5 = Label.new('Nestea',    330.0,     0.0,     0.0,  7.7,  7.7,    0.0,   0.04)
    end

    before :each do
      @list = List.new
      @list << @label1 << @label2 << @label3 << @label4 << @label5
    end

    it "Operador <<" do
      expect(@list.to_a).to eq([@label1, @label2, @label3, @label4, @label5])
    end

    it "Método each" do
      array = []
      @list.each do |label|
        array << label
      end
      expect(array).to eq([@label1, @label2, @label3, @label4, @label5])
    end

    it "Método reverse_each" do
      array = []
      @list.reverse_each do |label|
        array << label
      end
      expect(array).to eq([@label5, @label4, @label3, @label2, @label1])
    end

    it "Método unshift" do
      @list.unshift @label5
      @list.unshift @label4
      expect(@list.to_a).to eq([@label4, @label5, @label1, @label2, @label3, @label4, @label5])
    end

    it "Método insert" do
      @list.insert(5,@label5)
      @list.insert(0,@label1,@label2)
      @list.insert(2,@label3)
      expect(@list.to_a).to eq([@label1,@label2,@label3,@label1, @label2, @label3, @label4, @label5, @label5])
    end

    it "Método pop" do
      @list.pop 2
      expect(@list.to_a).to eq([@label1, @label2, @label3])
    end

    it "Método shift" do
      @list.shift
      @list.shift 2
      expect(@list.to_a).to eq([@label4, @label5])
    end

    it "Método sort" do
      ordered_array = @list.sort
      expect(ordered_array).to eq([@label5 ,@label3 ,@label1 ,@label4 ,@label2])
    end

  end

  describe Label do

    before :all do
      @NOMBRE, @PORCION, @GRASAS, @GRASASS,@HC, @AZUCAR, @PROTEI, @SAL =
      'OREO',    40.0,     20.0,     9.8,  69.0,  38.0,    5.0,   0.9
      @label = Label.new(@NOMBRE,@PORCION,@GRASAS,@GRASASS,@HC,@AZUCAR,@PROTEI,@SAL)
    end

    it "Almacenamiento de los datos" do
      expect(@label.nombre).to eq(@NOMBRE)
      expect(@label.porcion).to eq(@PORCION)
      expect(@label.grasas).to eq(@GRASAS)
      expect(@label.grasass).to eq(@GRASASS)
      expect(@label.hc).to eq(@HC)
      expect(@label.azucar).to eq(@AZUCAR)
      expect(@label.protei).to eq(@PROTEI)
      expect(@label.sal).to eq(@SAL)
    end

    it "Valor energético por 100g" do
      expect(@label.kj).to eq(2020.5)
      expect(@label.kcal).to eq(481.4)
    end

    it "Valores por porción" do
      expect(@label.toX(:grasas)).to eq(8)
      expect(@label.toX(:kj)).to eq(808.2)
    end

    it "Ingesta de referencia por 100 g" do
      expect(@label.ir(:kcal)).to eq(24.07)
      expect(@label.ir(:hc)).to eq(26.54)
    end

    it "Ingesta de referencia por porción" do
      expect(@label.toX(:ir,:kcal)).to eq(9.63)
      expect(@label.toX(:ir,:hc)).to eq(10.62)
    end

    it "Imprimiendo etiqueta" do
      expect(@label.to_s.class).to eq(String)
    end

  end

end
