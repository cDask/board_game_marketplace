class RemoveReviewFromTransaction < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :review, :text
  end
end
