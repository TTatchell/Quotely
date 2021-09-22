# frozen_string_literal: true

class ChangeQuoteColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :quotes, :quote_content, :content
  end
end
