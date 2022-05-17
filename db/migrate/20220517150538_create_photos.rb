class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :image
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.integer :comments_count

      t.timestamps
    end
  end
end
