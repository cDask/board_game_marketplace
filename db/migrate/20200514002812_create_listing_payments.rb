class CreateListingPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :listing_payments do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
