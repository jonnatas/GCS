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

    describe "GET #request_report"
    it "request report for public school and expect json" do
    	get "/report/request_report.json?utf8=%E2%9C%93&year=2008&state=AC&grade=1%C2%B0+ano&test_type=Publica&public_type=Total&local=Total"
    	expect_json = {:ideb=>
    		{:status=>"available",
    		 :ideb=>[4.3, 4.6],
    		  :ideb_average=>4.449999999999999,
    		   :ideb_standard_deviation=>0.1499999999999999, 
    		   :ideb_variance=>0.02249999999999997,
    		    :ideb_years=>["2009", "2011"], 
    		   :ideb_grade_ids=>["2", "4"]},
    		    :rates=>{:status=>"available",
    		     :evasion=>[4.1, 3.6, 6.0, 2.5, 2.6, 3.7],
    		      :performance=>[86.9, 91.3, 86.0, 88.9, 91.5, 88.5],
    		       :distortion=>[10.2, 30.5, 34.9, 14.7, 28.4, 32.7],
    		        :evasion_average=>3.75,
    		         :performance_average=>88.85000000000001,
    		          :distortion_average=>25.23333333333333,
    		           :evasion_standard_deviation=>1.1615363389350617,
    		            :performance_standard_deviation=>2.0443010215393085,
    		             :distortion_standard_deviation=>9.344457656220017, 
    		             :evasion_variance=>1.3491666666666664,
    		              :performance_variance=>4.179166666666661,
    		               :distortion_variance=>87.3188888888889},
    		                :year=>"2008", :grade=>1}
    end

    describe "GET #request_report"
    it "request report for specific public school and expect json" do
    	get "/report/request_report.json?utf8=%E2%9C%93&year=2008&state=AC&grade=1%C2%B0+ano&test_type=Publica&public_type=Federal&local=Total"
    	expect_json = {:ideb=>{:status=>"available",
    	 :ideb=>[4.3, 4.6],
    	  :ideb_average=>4.449999999999999, 
    	  :ideb_standard_deviation=>0.1499999999999999,
    	   :ideb_variance=>0.02249999999999997,
    	    :ideb_years=>["2009", "2011"],
    	     :ideb_grade_ids=>["2", "4"]},
    	      :rates=>{:status=>"available",
    	       :evasion=>[0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    	        :performance=>[87.1, 100.0, 75.0, 90.3, 88.9, 88.5],
    	         :distortion=>[0.0, 7.4, 10.7, 0.0, 7.7, 13.8],
    	          :evasion_average=>0.0, 
    	          :performance_average=>88.30000000000001,
    	           :distortion_average=>6.6000000000000005,
    	            :evasion_standard_deviation=>0.0,
    	             :performance_standard_deviation=>7.29863000843309, 
    	             :distortion_standard_deviation=>5.1254268114957995,
    	              :evasion_variance=>0.0, 
    	              :performance_variance=>53.27000000000001,
    	               :distortion_variance=>26.27}, :year=>"2008", :grade=>1}
    end
end