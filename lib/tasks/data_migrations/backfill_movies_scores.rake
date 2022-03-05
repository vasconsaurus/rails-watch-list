# frozen_string_literal: true

namespace :data_migrations do
  desc 'Migrating ratings from movies to score'
  task backfill_movie_scores: :environment do
    Movie.all.find_each do |movie|
      # pra ver o progresso da tarefa
      p "Backfilling score for movie ##{movie.id}"
      movie.score = movie.rating
      movie.save!
      # ou: movie.update!(score: movie.rating)
      # ou(manda direto pro DB): movie.update_column(:score, movie.rating)
    end
  end
end
