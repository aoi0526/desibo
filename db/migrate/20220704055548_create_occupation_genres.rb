class CreateOccupationGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :occupation_genres do |t|
      t.string :name
      t.timestamps
    end
  end
end
