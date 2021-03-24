class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :parameter
      t.string :title, null: false
      t.string :color

      t.timestamps
    end
  end
end
