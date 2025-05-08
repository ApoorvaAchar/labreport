class LabTest < ApplicationRecord
	validates :name, :key, presence: true
end
