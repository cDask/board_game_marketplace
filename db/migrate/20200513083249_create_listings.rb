class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :board_game_name
      t.string :condition
      t.string :listing_type
      t.integer :price
      t.string :board_game_trade
      t.text :description
      t.boolean :completed
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
