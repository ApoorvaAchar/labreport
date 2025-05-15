class TestResult < ApplicationRecord

	mount_uploader :pdf, PdfUploader

	before_create :generate_uuid

	def generate_uuid
    self.uuid = SecureRandom.uuid
	end


	def final_result
		hash = {}
    unless result.blank?
    	result["test_result"].each do |tr|
    		test_parameter =  TestParameter.find_by_key(tr["key"])

    		unless test_parameter.blank?
	    		parameter_ref_range = nil

	    		if test_parameter.parameter_type == 'string'
	    			parameter_ref_range = test_parameter.parameter_ref_ranges.where(result: "").first
	    		else
	    			parameter_ref_range = test_parameter.parameter_ref_ranges.where('? BETWEEN lower_limit AND upper_limit', tr["result"].to_f).order(:id).first
	    		end

	        unless parameter_ref_range.blank?
	        else
	        end
	      end

        hash[test_parameter.lab_test_id.to_s] ||= []
        j = { result: result, unit: (tr["unit"] rescue ""), test_parameter: test_parameter, parameter_ref_range: parameter_ref_range }
        hash[test_parameter.lab_test_id.to_s] << j
    	end
    end
    hash
	end 


	def test_done_at
		result["patient"]["test_done_at"] rescue ""
	end

	def gender
		result["patient"]["gender"] rescue ""
	end

	def age
		result["patient"]["age"] rescue ""
	end

	def patient_no
		result["patient"]["patient_no"] rescue ""
	end


end
