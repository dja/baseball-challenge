module API
  module V1
    class Players < Grape::API
      include API::V1::Defaults

      resource :players do
        desc 'All Players'
        get do
          Player.all
        end

        desc 'Create a Player'
        params do
          requires :name, type: String, desc: 'Name'
          requires :team_id, type: Integer, desc: 'Team ID'
        end
        post do
          Player.create!(permitted_params)
        end

        params do
          requires :id, type: Integer, desc: 'Player ID'
        end
        route_param :id do
          desc 'Get Player'
          get do
            Player.find(params[:id])
          end

          desc 'Update Player'
          params do
            optional :name, type: String, desc: 'Name'
          end
          put do
            Player.find(params[:id]).update!(permitted_params)
          end

          desc 'Delete Player'
          delete do
            Player.find(params[:id]).destroy!
          end
        end
      end
    end
  end
end
