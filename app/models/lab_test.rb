class LabTest < ApplicationRecord
	validates :name, :key, presence: true


	has_many :test_parameters
end
