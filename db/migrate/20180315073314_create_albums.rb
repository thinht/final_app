class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :desc
      t.boolean :is_public, default: true

      t.timestamps
    end
  end
end
