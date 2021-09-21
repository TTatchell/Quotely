# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :user

  validates :quote_content, presence: true, length: { maximum: 280 }
end
