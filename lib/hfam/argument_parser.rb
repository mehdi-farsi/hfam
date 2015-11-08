require "optparse"

module HFAM
  class ArgumentParser
    def parse
      options = {}

      o = ::OptionParser.new do |opts|
        opts.banner = ::HFAM::HELP
        

        opts.on("-h") do |h|
          options[:help] = ::HFAM::HELP
        end
      end
    begin
      o.parse!
    rescue ::OptionParser::InvalidOption => e
      $stderr.puts e
      $stderr.puts o.banner
      exit
    end
      options
    end
  end
end