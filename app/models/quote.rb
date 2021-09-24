# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :content, length: { maximum: 280 }
  validates :author, presence: true
end
