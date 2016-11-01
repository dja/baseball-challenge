module API
  module V1
    class Runs < Grape::API
      include API::V1::Defaults

      resource :runs do
        desc 'All Runs'
        get do
          Run.all
        end

        desc 'Create a Run'
        params do
          requires :game_id, type: Integer, desc: 'Game ID'
          requires :player_id, type: Integer, desc: 'Player ID'
        end
        post do
          Run.create!(permitted_params)
        end

        params do
          requires :id, type: Integer, desc: 'Run ID'
        end
        route_param :id do
          desc 'Get Run'
          get do
            Run.find(params[:id])
          end

          desc 'Update Run'
          params do
            optional :name, type: String, desc: 'Name'
          end
          put do
            Run.find(params[:id]).update!(permitted_params)
          end

          desc 'Delete Run'
          delete do
            Run.find(params[:id]).destroy!
          end
        end
      end
    end
  end
end
