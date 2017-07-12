class Source < ApplicationRecord
	belongs_to :route
	has_many :segments
end
