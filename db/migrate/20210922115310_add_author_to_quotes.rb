# frozen_string_literal: true

class AddAuthorToQuotes < ActiveRecord::Migration[6.1]
  def change
    add_column :quotes, :author, :string
  end
end
