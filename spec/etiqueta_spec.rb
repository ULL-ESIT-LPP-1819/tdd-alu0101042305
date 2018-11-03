RSpec.describe Etiqueta do

  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
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

  end

end
