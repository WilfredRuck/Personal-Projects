class Promotion < ApplicationRecord
	validates :code, :resource, :notes, presence: true
	validates_length_of :notes, :maximum => 100
end
