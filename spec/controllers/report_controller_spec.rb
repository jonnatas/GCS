require 'rspec'
require 'rails_helper'


RSpec.describe ReportController, :type =>:controller do


  it 'when request index' do
    get :index
    expect(response).to be_success
  end
end