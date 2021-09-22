# frozen_string_literal: true

class AddPublishedToQuotes < ActiveRecord::Migration[6.1]
  def change
    add_column :quotes, :published, :boolean
  end
end
