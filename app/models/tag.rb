class Tag < ApplicationRecord
  validates :name, presence: true

  belongs_to :post, inverse_of: :tags
end
