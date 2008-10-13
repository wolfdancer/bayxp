class Vote < ActiveRecord::Base
  has_many :ranked_games
end
