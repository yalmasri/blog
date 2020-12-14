class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  # enumn

  # validations

  # belongs_to relations

  # has_many relations
  has_many :access_tokens, as: :owner, inverse_of: :owner

  after_create :generate_access_token!

  def generate_access_token!
    access_tokens.create
  end
end
