class Chatroom < ApplicationRecord
	has_many :users
	has_many :messages, dependent: :destroy

	validates :title, presence: true, uniqueness: true
end