module HFAM
  class CommandSet
    def initialize
      @commands = {
        symlink: ::HFAM::Command::Symlink.new
      }
    end

    def dispatch_commands(payload)
      payload.commands.each do |command|
        log_error(command) and next if command[0] == :unknown
        @commands[:symlink].run(command)
      end
    end

  private
   def log_error(command)
    ::HFAM::Logger.error("Unknown command '#{command[1][:command]}' with args #{command[1][:args]}")
    true
   end
  end
end