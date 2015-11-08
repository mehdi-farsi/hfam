module HFAM
  module Logger
    class << self
      def success(message)
        puts message.green
      end

      def error(message)
        $stderr.puts message.red
        true
      end
    end
  end
end