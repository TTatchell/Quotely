# frozen_string_literal: true

class CreateQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes do |t|
      t.string :quote_content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
