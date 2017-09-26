class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages, dependent: :destroy
  has_many :chatrooms, through: :messages

  validates :username, presence: true, uniqueness: true, case_sensitive: false
  validate :validate_chats
  
  def validate_chats
    errors.add(:chatrooms, "You can only have 10 chatboxes at a time") if chatrooms.count > 15
  end
end
