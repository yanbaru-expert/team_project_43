class CreateLines < ActiveRecord::Migration[6.1]
  def change
    create_table :lines do |t|
      t.string :genre
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
