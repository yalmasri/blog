# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, uniqueness: { case_sensitive: false }
end
