class TestParameter < ApplicationRecord
	validates :name, :key, presence: true

	has_many :parameter_ref_ranges
end
