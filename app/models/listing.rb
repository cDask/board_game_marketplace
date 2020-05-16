class Listing < ApplicationRecord
  belongs_to :profile
  has_many :transactions
  has_many :listing_payments
  has_many :payments, through: :listing_payments
  validates :board_game_name,
            :condition,
            :listing_type,
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
  validates :price, presence: true, if: :listing_money?
  validates :board_game_trade, presence: true, if: :listing_trade?

  def listing_money?
    listing_type == 'Money'
  end

  def listing_trade?
    listing_type == 'Trade'
  end
end
