# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :content, length: { minimum: 10, maximum: 1000 }
  validates :author, presence: true
end
