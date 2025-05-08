class TestParameter < ApplicationRecord
	validates :name, :key, presence: true
end
