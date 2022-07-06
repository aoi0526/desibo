class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :detail
      t.integer :company_id
      t.timestamps
    end
  end
end
