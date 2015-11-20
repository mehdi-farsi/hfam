module HFAM
  class Application
    def initialize
      @payload = ::HFAM::Payload.new

      @payload.metadata = ArgumentParser.new.parse

      @command_set = CommandSet.new
    end

    def run
      if @payload.help_option?
        puts @payload.help_message
        return
      end

      dsl = ::HFAM::DSL.new(@payload).tokenize

      @command_set.dispatch_commands(@payload)
    end
  end
end