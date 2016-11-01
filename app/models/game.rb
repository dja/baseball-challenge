class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  has_many :runs

  def home_team_runs
    home_team.players.map {|p| p.runs.where(id: runs.ids).count }.reduce(:+)
  end

  def away_team_runs
    away_team.players.map {|p| p.runs.where(id: runs.ids).count }.reduce(:+)
  end
end
