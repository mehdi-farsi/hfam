module HFAM
  module Logger
    class << self
      def success(message)
        puts message.green
        true
      end

      def warn(message)
        puts message.orange
        true
      end

      def error(message)
        $stderr.puts message.red
        true
      end
    end
  end
end