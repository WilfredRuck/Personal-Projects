class Message < ApplicationRecord
	belongs_to :user
	belongs_to :chatroom

	validates :body, presence: true, length: {minimum: 1, maximum: 200}

	def timestamp
		created_at.strftime('%d %B %Y %I:%M%p')
	end
end
