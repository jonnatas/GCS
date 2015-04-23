require 'test_helper'

class ProvaBrasilTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "prova_brasil should not be nil" do
  	prova_brasil = ProvaBrasil.new(2013,2,3,2004)
  	assert_not_nil prova_brasil, 'prova_brasil returned nil object'
  end

  test "average should be 5" do
  	prova_brasil = ProvaBrasil.new(2013,2,3,2004)
  	scores_array = [5,5,5]
  	average = prova_brasil.compute_average_for(scores_array)
  	assert_same 5.0, average, 'compute_average_for returned wrong average'
  end


end
