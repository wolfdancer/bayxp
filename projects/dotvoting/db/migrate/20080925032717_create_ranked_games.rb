class CreateRankedGames < ActiveRecord::Migration
  def self.up
    create_table :ranked_games do |t|
      t.integer :vote_id
      t.integer :game_id
      t.integer :rank

      t.timestamps
    end
  end

  def self.down
    drop_table :ranked_games
  end
end
