class Listing < ApplicationRecord
  belongs_to :profile
  has_many :transactions
  has_many :listing_payments
  has_many :payments, through: :listing_payments
  has_many_attached :picture
  validates :board_game_name,
            :condition,
            :listing_type,
            presence: true
  validates :listing_type, inclusion: {
    in: %w[Sell Trade],
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
  validates :price, presence: true, if: :listing_sell?
  validates :board_game_trade, presence: true, if: :listing_trade?

  def listing_sell?
    listing_type == 'Sell'
  end

  def listing_trade?
    listing_type == 'Trade'
  end
end
