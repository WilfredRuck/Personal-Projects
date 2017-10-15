class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages, dependent: :destroy
  has_many :chatrooms, through: :messages

  validates :username, presence: true, uniqueness: true
  validate :validate_chats
  
  def validate_chats
    errors.add(:chatrooms, "You can only own 10 chatboxes at a time") if chatrooms.count >= 10
  end

  # def online?
  #   !Redis.new.get("user_#{self.id}_online").nil?
  # end
end
