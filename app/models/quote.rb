# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 280 }
  validates :author, presence: true
end
