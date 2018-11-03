RSpec.describe Etiqueta do

  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  describe Label do
    @NOMBRE, @PORCION, @GRASAS, @GRASASS,@HC, @AZUCAR, @PROTEI, @SAL =
    'OREO',    40.0,     7.9,     3.9,   28.0,  15.0,    2.0,   0.35
    @label = Label.new(@NOMBRE,@PORCION,@GRASAS,@GRASASS,@HC,@AZUCAR,@PROTEI,@SAL)
  end

end
