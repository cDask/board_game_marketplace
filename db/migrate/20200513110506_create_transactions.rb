class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
