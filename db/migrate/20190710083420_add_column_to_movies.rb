class AddColumnToMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :release_date, :datetime
    add_column :movies, :cast, :string
    add_column :movies, :director, :string
    add_column :movies, :duration, :string
    add_column :movies, :image_file_name, :string, default: "movie logo"
  end
end
