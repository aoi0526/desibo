class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :room_id
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
