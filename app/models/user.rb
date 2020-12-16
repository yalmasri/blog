class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  # enumn
  enum status: %i[active inactive]

  # validations

  # belongs_to relations

  # has_many relations
  has_many :access_tokens, as: :owner, inverse_of: :owner
  has_many :posts, inverse_of: :user

  after_create :generate_access_token!

  def generate_access_token!
    access_tokens.create
  end

  def active_for_authentication?
    super && active?
  end
end
