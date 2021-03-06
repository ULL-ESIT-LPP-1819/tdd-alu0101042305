RSpec.describe Etiqueta do

  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  describe Menu do

    before :all do
      @menu = Menu.new("Lunes") do
        titulo "Bajo en calorı́as"
        ingesta :min => 30, :max => 35

        desayuno :descripcion => "Pan de trigo integral",
          :gramos => 100,
          :grasas => 3.3,
          :carbohidratos => 54.0,
          :proteinas => 11.0,
          :sal => 0.06

        desayuno :descripcion => "Actimel",
          :gramos => 100,
          :grasas => 3.4,
          :carbohidratos => 4.4,
          :proteinas => 3.6,
          :sal => 0.05

        almuerzo :descripcion => "Arroz",
          :gramos => 100,
          :grasas => 0.9,
          :carbohidratos => 81.6,
          :proteinas => 6.67,
          :sal => 0.04

        almuerzo :descripcion => "Lentejas",
          :gramos => 100,
          :grasas => 0.4,
          :carbohidratos => 20.0,
          :proteinas => 9.0,
          :sal => 8.0

        cena :descripcion => "Leche entera hacendado",
          :gramos => 100,
          :grasas => 3.6,
          :carbohidratos => 4.6,
          :proteinas => 3.1,
          :sal => 0.13
      end
    end

    it 'Metodo to_s' do
      table = Table.new
      table << 'Lunes'
      table << '' << 'grasas' << 'carbohidratos' << 'proteinas' << 'sal' << 'valor energético'
      table << 'Desayuno'
      table << 'Pan de trigo integral' << 3.3 << 54.0 << 11.0 << 0.06 << 290.06
      table << 'Actimel' << 3.4 << 4.4 << 3.6 << 0.05 << 62.9
      table << ''
      table << 'Almuerzo'
      table << 'Arroz' << 0.9 << 81.6 << 6.67 << 0.04 << 361.42
      table << 'Lentejas' << 0.4 << 20.0 << 9.0 << 8.0 << 167.6
      table << ''
      table << 'Cena'
      table << 'Leche entera hacendado' << 3.6 << 4.6 << 3.1 << 0.13 << 63.98
      table << 'Valor energético total' << 945.96
      expect(@menu.to_s).to eq(table.to_s)
    end

  end

=begin
  describe Menu do

    before :all do
      @ensalada = Label.new('Ensalada',    40.0,     20.0,     9.8,  69.0,  38.0,    5.0,   0.9)
      @carne = Label.new('Carne',    30.0,     35.1,     4.6,  47.7,  0.6,     6.3,   1.3)
      @pescado = Label.new('Pescado',  25.0,     19.0,     12.0, 68.0,  35.0,    6.8,   0.81)
      @menu1 = Menu.new(@ensalada,@carne,@pescado)
      @menu2 = Menu.new(@carne,@carne,@pescado)
      @menu3 = Menu.new(@ensalada,@carne,@carne)
      @menu4 = Menu.new(@carne,@carne,@carne)
      @menu5 = Menu.new(@ensalada,@ensalada,@pescado)
      @menu6 = Menu.new(@ensalada,@carne,@ensalada)
      @menu7 = Menu.new(@ensalada,@ensalada,@ensalada)
      @menu8 = Menu.new(@pescado,@carne,@pescado)
      @menu9 = Menu.new(@ensalada,@pescado,@pescado)
      @menu10 = Menu.new(@pescado,@pescado,@pescado)

      @persona1 = PacienteT.new('Ana','mujer','Hospital de Guadalupe',65.3,1.75,32,67.0,70.0,'moderada')
      @persona2 = PacienteT.new('Marta','mujer','Hospital de Guadalupe',83.0,1.71,64,80.0,90.0,'ninguna')
      @persona3 = PacienteT.new('Juan','hombre','Hospital de los Dolores',67.0,1.72,28,70.0,80.0,'ligera')
      @persona4 = PacienteT.new('Maria','mujer','Hospital de la Candelaria',45.0,1.39,12,40.0,47.0,'ligera')
      @persona5 = PacienteT.new('Carlos','hombre','Hospital del Carmen',70.0,1.69,45,80.0,81.0,'intensa')
      @persona6 = PacienteT.new('Julia','mujer','Hospital de Guadalupe',70.0,1.73,22,67.0,70.0,'moderada')
      @persona7 = PacienteT.new('Pepa','mujer','Hospital de Guadalupe',89.0,1.61,64,80.0,90.0,'ninguna')
      @persona8 = PacienteT.new('Marcos','hombre','Hospital de los Dolores',78.0,1.82,23,70.0,80.0,'ligera')
      @persona9 = PacienteT.new('Teresa','mujer','Hospital de la Candelaria',40.0,1.39,9,40.0,47.0,'ligera')
      @persona10 = PacienteT.new('Jose','hombre','Hospital del Carmen',77.0,1.71,45,80.0,81.0,'intensa')
    end

    before :each do
      @array = Array.new << @menu1 << @menu2 << @menu3 << @menu4 << @menu5
      @array << @menu6 << @menu7 << @menu8 << @menu9 << @menu10

      @list = List.new << @persona1 << @persona2 << @persona3 << @persona4 << @persona5
      @list  << @persona6  << @persona7  << @persona8  << @persona9 << @persona10
    end

    it 'Usando for' do
      expect(Menu.for_sort(@array)).to eq([@menu10,@menu9,@menu5,@menu7,@menu8,@menu1,@menu6,@menu2,@menu3,@menu4])
      expect(@list.for_sort).to eq([@persona9,@persona4,@persona7,@persona2,@persona1,@persona3,@persona6,@persona8,@persona5,@persona10])
    end

    it 'Usando each' do
      expect(Menu.each_sort(@array)).to eq([@menu10,@menu9,@menu5,@menu7,@menu8,@menu1,@menu6,@menu2,@menu3,@menu4])
      expect(@list.each_sort).to eq([@persona9,@persona4,@persona7,@persona2,@persona1,@persona3,@persona6,@persona8,@persona5,@persona10])
    end

    it 'Usando sort' do
      expect(@array.sort).to eq([@menu10,@menu9,@menu5,@menu7,@menu8,@menu1,@menu6,@menu2,@menu3,@menu4])
      expect(@list.sort).to eq([@persona9,@persona4,@persona7,@persona2,@persona1,@persona3,@persona6,@persona8,@persona5,@persona10])
    end

    it 'Benchmark' do
      puts 'Menus'
      Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
        tf = x.report("for:")   { Menu.for_sort(@array) }
        tt = x.report("each:") { Menu.each_sort(@array) }
        tu = x.report("sort:")  { @array.sort }
        [tf+tt+tu, (tf+tt+tu)/3]
      end

      puts 'Personas'
      Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
        tf = x.report("for:")   { @list.for_sort }
        tt = x.report("each:") { @list.each_sort }
        tu = x.report("sort:")  { @list.sort }
        [tf+tt+tu, (tf+tt+tu)/3]
      end
    end

  end

  describe 'Menú dietético' do

    before :all do
      @persona1 = PacienteM.new('Ana','mujer','Hospital de Guadalupe',65.3,1.75,32,67.0,70.0,'moderada')
      @persona2 = PacienteM.new('Marta','mujer','Hospital de Guadalupe',83.0,1.71,64,80.0,90.0,'ninguna')
      @persona3 = PacienteM.new('Juan','hombre','Hospital de los Dolores',67.0,1.72,28,70.0,80.0,'ligera')
      @persona4 = PacienteM.new('Maria','mujer','Hospital de la Candelaria',45.0,1.39,12,40.0,47.0,'ligera')
      @persona5 = PacienteM.new('Carlos','hombre','Hospital del Carmen',70.0,1.69,45,80.0,81.0,'intensa')

      @ensalada = Label.new('Ensalada',    40.0,     20.0,     9.8,  69.0,  38.0,    5.0,   0.9)
      @carne = Label.new('Carne',    30.0,     35.1,     4.6,  47.7,  0.6,     6.3,   1.3)

      @persona1.addMenu(Menu.new(@ensalada,@ensalada,@ensalada,@ensalada))
      @persona2.addMenu(Menu.new(@ensalada,@ensalada,@carne))
      @persona3.addMenu(Menu.new(@ensalada,@ensalada))
      @persona4.addMenu(Menu.new(@carne,@carne,@carne))
      @persona5.addMenu(Menu.new(@ensalada,@ensalada,@carne,@carne,@carne))
    end

    it 'Comprobando menus' do
      expect(@persona1.menuOk?).to eq(true)
      expect(@persona2.menuOk?).to eq(true)
      expect(@persona3.menuOk?).to eq(false)
      expect(@persona4.menuOk?).to eq(false)
      expect(@persona5.menuOk?).to eq(true)
    end

    it 'Calorias de los menus' do
      expect(@persona1.menu.kcal).to eq(1925.6)
      expect(@persona2.menu.kcal).to eq(1502.5)
      expect(@persona3.menu.kcal).to eq(962.8)
      expect(@persona4.menu.kcal).to eq(1619.1)
      expect(@persona5.menu.kcal).to eq(2581.9)
    end

    it 'Peso ideal' do
      expect(@persona1.pesoIdeal).to eq(68.75)
      expect(@persona2.pesoIdeal).to eq(65.75)
      expect(@persona3.pesoIdeal).to eq(66.5)
      expect(@persona4.pesoIdeal).to eq(41.75)
      expect(@persona5.pesoIdeal).to eq(64.25)
    end

    it 'Gasto energético basal' do
      expect(@persona1.basal).to eq(1425.75)
      expect(@persona2.basal).to eq(1417.75)
      expect(@persona3.basal).to eq(1610.0)
      expect(@persona4.basal).to eq(1097.75)
      expect(@persona5.basal).to eq(1536.25)
    end

    it 'Efecto termógeno' do
      expect(@persona1.termogeno).to eq(142.58)
      expect(@persona2.termogeno).to eq(141.78)
      expect(@persona3.termogeno).to eq(161.0)
      expect(@persona4.termogeno).to eq(109.78)
      expect(@persona5.termogeno).to eq(153.63)
    end

    it 'Gasto de actividad física' do
      expect(@persona1.actividad).to eq(384.95)
      expect(@persona2.actividad).to eq(0)
      expect(@persona3.actividad).to eq(193.2)
      expect(@persona4.actividad).to eq(131.73)
      expect(@persona5.actividad).to eq(829.58)
    end

    it 'Gasto energético total' do
      expect(@persona1.total).to eq(1953.28)
      expect(@persona2.total).to eq(1559.53)
      expect(@persona3.total).to eq(1964.2)
      expect(@persona4.total).to eq(1339.26)
      expect(@persona5.total).to eq(2519.46)
    end

  end

=end

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
