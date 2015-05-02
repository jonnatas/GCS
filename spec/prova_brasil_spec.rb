require 'rspec'
require_relative '../app/models/prova_brasil'

describe ProvaBrasil do

  before :each do
    @prova_brasil = ProvaBrasil.new(2011,1,1)
  end

  describe "#initialize"
  it "take the params and set them to the object" do
    expect(@prova_brasil.instance_variable_get(:@year)).to eq(2011)
    expect(@prova_brasil.instance_variable_get(:@id_grade)).to eq(1)
    expect(@prova_brasil.instance_variable_get(:@id_state)).to eq(1)
  end

end