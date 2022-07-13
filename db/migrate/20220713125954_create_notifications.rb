class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|

      t.integer :company_visiter_id
      t.integer :company_visited_id
      t.integer :user_visiter_id
      t.integer :user_visited_id
      t.integer :post_id
      t.integer :message_id
      t.integer :action
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
