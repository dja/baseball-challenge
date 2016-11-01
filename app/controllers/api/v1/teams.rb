module API
  module V1
    class Teams < Grape::API
      include API::V1::Defaults

      resource :teams do
        desc 'All Teams'
        get do
          Team.all
        end

        desc 'Create a Team'
        params do
          requires :name, type: String, desc: 'Name'
        end
        post do
          Team.create!(permitted_params)
        end

        params do
          requires :id, type: Integer, desc: 'Team ID'
        end
        route_param :id do
          desc 'Get Team'
          get do
            Team.find(params[:id])
          end

          desc 'Update Team'
          params do
            optional :name, type: String, desc: 'Name'
          end
          put do
            Team.find(params[:id]).update!(permitted_params)
          end

          desc 'Delete Team'
          delete do
            Team.find(params[:id]).destroy!
          end
        end
      end
    end
  end
end
