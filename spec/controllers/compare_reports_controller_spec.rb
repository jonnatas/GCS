require 'rspec'
  require 'rails_helper'

  describe CompareReportsController, :type => :request do

    describe "GET #index"
    it "request index and return success" do
      get "compare_reports/index"
      expect(response).to render_template("index")
    end

    describe "GET #request_comparation"
    it "request index and return success" do
      # get :request_comparation , :params => { :first_year => "2008", :first_state => "AC", :first_local => "Total", :first_test_type => "Total", :first_public_type => "Total", :second_year => "2008", :second_state => "AC", :second_local => "Total", :second_test_type =>"Total", :second_public_type => "Total", :grade => "1° ano"}
      get "/compare_reports/request_comparation.json?utf8=%E2%9C%93&first_year=2008&first_state=AC&first_local=Total&first_test_type=Total&first_public_type=Total&second_year=2008&second_state=AC&second_local=Total&second_test_type=Total&second_public_type=Total&grade=1%C2%B0+ano&commit=Gerar+Relat%C3%B3rio"

      expected_json = {:first_report=>{
          :ideb=>{
              :status=>"available",
              :ideb=>[4.3, 4.6],
              :ideb_average=>4.449999999999999,
              :ideb_standard_deviation=>0.1499999999999999,
              :ideb_variance=>0.02249999999999997,
              :ideb_years=>["2009", "2011"],
              :ideb_grade_ids=>["2", "4"]},
          :rates=>{:status=>"available",
                   :evasion=>[3.9, 3.5, 5.7, 2.4, 2.5, 3.5],
                   :performance=>[87.4, 91.6, 86.5, 89.3, 91.8, 88.9],
                   :distortion=>[9.8, 29.7, 33.8, 14.2, 27.5, 31.5],
                   :evasion_average=>3.5833333333333335,
                   :performance_average=>89.25,
                   :distortion_average=>24.416666666666668,
                   :evasion_standard_deviation=>1.0930334954713063,
                   :performance_standard_deviation=>1.9636275953788493,
                   :distortion_standard_deviation=>9.070725194578191,
                   :evasion_variance=>1.1947222222222225,
                   :performance_variance=>3.8558333333333223,
                   :distortion_variance=>82.27805555555555},
          :year=>"2008",
          :grade=>1},
          :second_report=>{
          :ideb=>{
              :status=>"available",
              :ideb=>[4.3, 4.6],
              :ideb_average=>4.449999999999999,
              :ideb_standard_deviation=>0.1499999999999999,
              :ideb_variance=>0.02249999999999997,
              :ideb_years=>["2009", "2011"],
              :ideb_grade_ids=>["2", "4"]},
          :rates=>{:status=>"available",
                   :evasion=>[3.9, 3.5, 5.7, 2.4, 2.5, 3.5],
                   :performance=>[87.4, 91.6, 86.5, 89.3, 91.8, 88.9],
                   :distortion=>[9.8, 29.7, 33.8, 14.2, 27.5, 31.5],
                   :evasion_average=>3.5833333333333335,
                   :performance_average=>89.25,
                   :distortion_average=>24.416666666666668,
                   :evasion_standard_deviation=>1.0930334954713063,
                   :performance_standard_deviation=>1.9636275953788493,
                   :distortion_standard_deviation=>9.070725194578191,
                   :evasion_variance=>1.1947222222222225,
                   :performance_variance=>3.8558333333333223,
                   :distortion_variance=>82.27805555555555},
          :year=>"2008",
          :grade=>1}
      }.to_json

      puts "-----------"
      expect(response.body).to eq(expected_json)

    end

  end