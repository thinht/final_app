class AddPaperclipToAlbum < ActiveRecord::Migration[5.1]
  def up
    add_attachment :albums, :image
  end

  def down
    remove_attachment :albums, :image
  end
end
