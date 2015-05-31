require 'rspec'
require 'rails_helper'

describe CompareReportsController do

  describe "GET #index"
  it "request index and return success" do
    get :index
    #expect(controller)
    expect(response).to render_template("index")
  end
  


end