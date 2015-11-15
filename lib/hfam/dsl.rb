module HFAM
  # Should respond to method :tokenize and :route
  class DSL
    def initialize(payload)
      @payload = payload
    end

    def tokenize
      raw_commands = eval(::File.open(::HFAM::HFAMCONFIG_PATH).read)
    end

    def symlink(file, options = {})
      @payload.commands << [:symlink, "#{DEFAULT_DOTFILE_PATH}/#{file}", dest_path(file, options)]
    end

    def source(file, options = {})
      symlink(file)
      @payload.commands << [:source, "#{DEFAULT_DOTFILE_PATH}/#{file}", dest_path(file, options)]
    end

    def route
      @command_set.run_command
    end

    def method_missing(method, *args, &block)
      @payload.commands << [:unknown, { command: method, args: args }]
    end

    def dest_path(file, options = {})
      options.include?(:dest) ? options[:dest] : ::HFAM::HOME
    end
  end
end