module Maksekeskus
  module Resource
    class Transaction < Base
      def create(body)
        connection.auth_level_2 do |conn|
          SiteResponse.new(conn.post('transactions', body))
        end
      end

      def get(id)
        connection.auth_level_2 do |conn|
          SiteResponse.new(conn.get("transactions/#{id}"))
        end
      end

      def list(query)
        connection.auth_level_2 do |conn|
          SiteResponse.new(conn.get('transactions', query))
        end
      end
    end
  end
end
