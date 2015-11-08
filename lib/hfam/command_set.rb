module HFAM
  class CommandSet
    def initialize
      @commands = {
        symlink: ::HFAM::Command::Symlink.new,
        source:  ::HFAM::Command::Source.new
      }
    end

    def dispatch_commands(payload)
      payload.commands.each_with_index do |command, index|
        ::HFAM::Logger.error("hfamconfig:#{index + 1} : unknown command '#{command[1][:command]}' with args #{command[1][:args]}") and next if command[0] == :unknown
        
        @commands[command[0]].run(command)
      end
    end

  end
end