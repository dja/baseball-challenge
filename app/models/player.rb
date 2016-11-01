class Player < ApplicationRecord
  belongs_to :team
  has_many :runs

  scope :top, -> { order(runs_count: :desc) }
end
