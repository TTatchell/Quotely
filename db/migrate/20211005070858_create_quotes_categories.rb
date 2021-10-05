class CreateQuotesCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes_categories do |t|
      t.references :quote, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
