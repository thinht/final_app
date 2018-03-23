class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :desc
      t.boolean :is_public, default: true

      t.timestamps
    end
  end
end
