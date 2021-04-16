class ChangeParameterAddNotnullOnGenres < ActiveRecord::Migration[6.1]
  def change
    change_column :genres, :parameter, :string, null: false
  end
end
