module Maksekeskus
  module Resource
    class Base
      attr_reader :connection

      def initialize(connection)
        @connection = connection
      end
    end
  end
end
