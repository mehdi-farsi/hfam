module HFAM
  class Application
    include ::HFAM::OptionFilter

    def initialize
      @payload = ::HFAM::Payload.new

      @payload.metadata = ArgumentParser.new.parse

      # module OptionFilter#filter
      filter

      @command_set = CommandSet.new
    end

    def run
      dsl = ::HFAM::DSL.new(@payload).tokenize

      @command_set.dispatch_commands(@payload)
    end
  end
end