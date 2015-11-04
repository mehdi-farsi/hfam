module HFAM
  module SourceFile
    class Monitor

      class << self

        def lookup
          source_files
          Dir.glob("./lib/hfam/source_files/*").map { |source_file| source_file.scan(/\/<(\w)+>\.rb$/).first }
        end

      end

    end
  end
end