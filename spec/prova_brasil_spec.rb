require 'rspec'
require_relative '../app/models/prova_brasil'

describe ProvaBrasil do

  before :each do
    @year = 2005
    @id_grade = 1
    @id_state = 1
    @prova_brasil = ProvaBrasil.new(@year,@id_grade,@id_state)
    @prova_brasil.request_prova_brasil_report
  end

  describe "#initialize"
  it "take the params and set them to the object" do
    @final_year = ProvaBrasil.final_year_avaiable(@year,@id_grade,@id_state)
    expect(@prova_brasil).not_to eq(nil)
    expect(@prova_brasil.instance_variable_get(:@year)).to eq(@year)
    expect(@prova_brasil.instance_variable_get(:@id_grade)).to eq(@id_grade)
    expect(@prova_brasil.instance_variable_get(:@id_state)).to eq(@id_state)
    expect(@prova_brasil.instance_variable_get(:@final_year)).to eq(@final_year)
  end

  describe "#final_year_avaiable"
    it "take the state, grade and year and return the final year avaiable for the current prova_brasil" do
      @final_year = ProvaBrasil.final_year_avaiable(@year,@id_grade,@id_state)
      expect(@final_year).to eq("2012")
    end

  describe "#request_prova_brasil"
    it "Take de state, grade and year and return a ProvaBrasil object from DB" do
      new_prova_brasil = @prova_brasil.request_prova_brasil(2005,1,1)
      expect(new_prova_brasil.id).to eq(1)
      expect(new_prova_brasil.id_test).to eq(1)
      expect(new_prova_brasil.id_grade).to eq(1)
      expect(new_prova_brasil.total_students).to eq(30)
      expect(new_prova_brasil.portuguese_score).to eq(6.6)
      expect(new_prova_brasil.math_score).to eq(6.7)
      expect(new_prova_brasil.year).to eq(2005)
      expect(new_prova_brasil.id_state).to eq(1)
    end

  describe "#request_rate_report"
    it "Request the Prova Brasil report with the initial variable values" do
      expect(@prova_brasil.instance_variable_get(:@math_score_result)).to eq([6.7, 4.7, 8.7, 8.7, 8.7, 8.7, 8.7, 8.7])
      expect(@prova_brasil.instance_variable_get(:@portuguese_score_result)).to eq([6.6, 7.0, 9.6, 8.6, 3.6, 5.6, 6.6, 0.0])
    end
end