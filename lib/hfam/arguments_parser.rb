require 'optparse'

module HFAM
  class ArgumentsParser
    def parse
      options = {}

      o = ::OptionParser.new do |opts|
        opts.banner = "usage: wc [-clhmw] [file ...]"
        

        opts.on("-h") do |h|
          options[:help] = <<-EOF
dotfile-manager options:

hfam [-a[ll]]
    [--pick FILE1,FILE2,... [-p[ath] PATH_TO_DOTFILES]]
    [-p[ath] PATH_TO_DOTFILES]
    [-e[dit] EDITOR=YOUR_EDITOR [-p[ath] PATH_TO_DOTFILES]]

-a --all  # execute the right command for each dotfile [DEFAULT OPTION]
--pick    # execute the command for the selected files
-p --path # custom dotfiles path
-e --edit # open the dotfiles directory with the editor set in $EDITOR. It work with --path option
          EOF
        end
      end
    begin
      o.parse!
    rescue ::OptionParser::InvalidOption => e
      $stderr.puts e
      $stderr.puts o.banner
      exit
    end
    # TODO: ugly code to refactor :(
      options
    end
  end
end