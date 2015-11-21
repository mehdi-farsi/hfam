require "optparse"

module HFAM
  class ArgumentParser
    def parse
      options = {}

      o = ::OptionParser.new do |opts|

        opts.banner = ::HFAM::HELP
        
        opts.on("-h", "--help") do |h|
          options[:help] = ::HFAM::HELP
        end

        opts.on("-p=PATH", "--path=PATH") do |p|
          options[:path] = p
        end

        opts.on("-v", "--version") do |v|
          options[:version] = ::HFAM::VERSION_MESSAGE
        end

      end
    begin
      o.parse!
    rescue ::OptionParser::InvalidOption => e
      $stderr.puts e
      $stderr.puts o.banner
      exit
    rescue ::OptionParser::MissingArgument => e
      $stderr.puts e
      exit
    end
      options
    end
  end
end