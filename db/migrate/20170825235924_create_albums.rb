class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.date :year, null: false
      t.integer :band_id, null: false
      t.boolean :recorded?,  null: false

      t.timestamps
    end

    add_index :albums, :id
  end
end
