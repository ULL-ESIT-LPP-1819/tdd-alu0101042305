RSpec.describe Etiqueta do

  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  describe List do

  end

  describe Label do

    before :each do
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
