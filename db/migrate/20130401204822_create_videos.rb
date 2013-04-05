class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :image
      t.string :data_url
      t.string :source
      t.string :source_id
      t.references :friend

      t.timestamps
    end
  end
end
