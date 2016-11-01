module API
  module V1
    class Base < Grape::API

      before do
        header 'X-Robots-Tag', 'noindex'
      end

      mount API::V1::Players
      mount API::V1::Teams
      mount API::V1::Games
      mount API::V1::Runs
    end
  end
end
