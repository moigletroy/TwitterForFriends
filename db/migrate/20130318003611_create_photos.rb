class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.string :description
      t.references :friend
      
      t.timestamps
    end
  end
end
