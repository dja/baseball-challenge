module API
  module V1
    class Games < Grape::API
      include API::V1::Defaults

      resource :games do
        desc 'All Games'
        get do
          Game.all
        end

        desc 'Create a Game'
        params do
          requires :home_team_id, type: Integer, desc: 'Home Team ID'
          requires :away_team_id, type: Integer, desc: 'Away Team ID'
        end
        post do
          Game.create!(permitted_params)
        end

        params do
          requires :id, type: Integer, desc: 'Game ID'
        end
        route_param :id do
          desc 'Get Game'
          get do
            Game.find(params[:id])
          end

          desc 'Update Game'
          params do
            optional :home_team_id, type: Integer, desc: 'Home Team ID'
            optional :away_team_id, type: Integer, desc: 'Away Team ID'
          end
          put do
            Game.find(params[:id]).update!(permitted_params)
          end

          desc 'Delete Game'
          delete do
            Game.find(params[:id]).destroy!
          end
        end
      end
    end
  end
end
