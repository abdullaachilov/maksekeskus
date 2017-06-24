module Maksekeskus
  module Resource
    class Shop < Base
      def info
        connection.auth_level_2 do |conn|
          SiteResponse.new(conn.get('shop'))
        end
      end

      def configuration
        connection.auth_level_2 do |conn|
          SiteResponse.new(conn.get('shop/configuration'))
        end
      end

      def accountstatements(query)
        connection.auth_level_2 do |conn|
          SiteResponse.new(conn.get('shop/accountstatements', query))
        end
      end

      def fees(query)
        connection.auth_level_2 do |conn|
          SiteResponse.new(conn.get('shop/fees', query))
        end
      end
    end
  end
end
