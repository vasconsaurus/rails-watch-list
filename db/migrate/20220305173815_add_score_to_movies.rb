class AddScoreToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :score, :float
  end
end
