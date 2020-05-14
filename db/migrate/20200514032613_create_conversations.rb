class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.refrences :author
      t.refrences :reciever

      t.timestamps
    end
  end
end
