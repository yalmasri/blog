# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, uniqueness: { case_sensitive: false }

  belongs_to :user, inverse_of: :posts, optional: true

  has_many :tags, inverse_of: :post, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: true
end
