require 'rspec'
require_relative '../app/helpers/report_helper'

describe ReportHelper do

  describe "#compute_average_for"
  it "take an array with data and return the average" do
    average = ReportHelper.compute_average_for([1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0])
    expect(average).to eq(5.5)
  end

  describe "#compute_standard_deviation"
  it "take an array with data and return the standar deviation calc of this data" do
    deviation = ReportHelper.compute_standard_deviation([0.0,3.6,5.6,6.6,6.6,7.0,8.6,9.6])
    expect(deviation).to eq(2.8138052526783013)
  end

  describe "#compute_variance"
  it "take an array with data and return the varience calc of this data " do
    variance = ReportHelper.compute_variance([0.0,3.6,5.6,6.6,6.6,7.0,8.6,9.6])
    expect(variance.round(4)).to eq(7.9175)
  end

end