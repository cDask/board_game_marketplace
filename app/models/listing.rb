class Listing < ApplicationRecord
  belongs_to :profile
  validates :board_game_name,
            :condition,
            :listing_type,
            :completed,
            presence: true
  validates :listing_type, inclusion: {
    in: %w[Money Trade],
    message: '%<value> is not a valid listing type'
  }
  validates :condition, inclusion: {
    in: [
      'Brand New in Shrink',
      'Played a few times',
      'Unplayed but punched',
      'Missing pieces',
      'Dented box',
      'Heavily played'
    ],
    message: '%<value> is not a valid listing type'
  }
end
