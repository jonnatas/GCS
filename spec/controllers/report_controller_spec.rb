require 'rspec'
require 'rails_helper'


describe ReportController, :type =>:request do
    describe "GET #index"
    it "request index and return success" do
      get "report/index"
      expect(response).to render_template("index")
    end


    describe "GET #request_report"
    it "request request_report and return json" do
    	get "/report/request_report.json?utf8=%E2%9C%93&year=2008&state=AC&grade=1%C2%B0+ano&test_type=Total&public_type=Total&local=Total"
    	expect_json ={:ideb => {
    					:status=>"available",
    					 :ideb=>[4.3, 4.6],
    					  :ideb_average=>4.449999999999999,
    					   :ideb_standard_deviation=>0.1499999999999999,
    					    :ideb_variance=>0.02249999999999997,
    					     :ideb_years=>["2009", "2011"],
    					      :ideb_grade_ids=>["2", "4"]
    					      },
    				 :rates=>{
    				 	:status=>"available",
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
    				 	           :distortion_variance=>82.27805555555555
    				 	    },
    				 	:year=>"2008", :grade=>1
    				}
    end

    describe "GET #request_report"
    it "request a false data at resquest_report and expect exception handler" do
    	get "/report/request_report.json?utf8=%E2%9C%93&year=2012&state=AC&grade=1%C2%B0+ano&test_type=Total&public_type=Total&local=Total"
    	expect_json = {:ideb=>{:status=>"unavailable"},
    	 :rates=>{:status=>"available",
    	  :evasion=>[2.9, 2.4],
    	   :performance=>[96.1, 82.3],
    	    :distortion=>[29.0, 26.9],
    	     :evasion_average=>2.65,
    	      :performance_average=>89.19999999999999,
    	       :distortion_average=>27.95,
    	        :evasion_standard_deviation=>0.25,
    	         :performance_standard_deviation=>6.899999999999999,
    	          :distortion_standard_deviation=>1.0500000000000007, 
    	          :evasion_variance=>0.0625, :performance_variance=>47.609999999999985,
    	           :distortion_variance=>1.1025000000000016}, :year=>"2012", :grade=>1}
    end
end