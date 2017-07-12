class Route < ApplicationRecord
	has_many :sources
	has_many :segments, through: :sources

end
