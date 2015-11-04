require 'hfam/source_file'

module HFAM
  class Command
    def initialize
      @options = ArgumentParser.new.parse

      if @options.include? :help
        puts @options[:help]
        exit(1)
      end

      # source_files = 
    end
  end
end