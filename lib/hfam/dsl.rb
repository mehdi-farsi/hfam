module HFAM
  # Should respond to method :tokenize and :route
  class DSL
    def initialize(payload)
      @payload = payload
    end

    def tokenize
      raw_commands = eval(::File.open("#{dotfiles_path}/.hfamconfig").read)
    end

    def symlink(file, options = {})
      @payload.commands << [:symlink, "#{dotfiles_path}/#{file}", dest_path(options)]
    end

    def source(file, options = {})
      symlink(file)
      @payload.commands << [:source, "#{dotfiles_path}/#{file}", dest_path(options)]
    end

    def route
      @command_set.run_command
    end

    def method_missing(method, *args, &block)
      @payload.commands << [:unknown, { command: method, args: args }]
    end

  private
    def dotfiles_path
      # File::expand_path convert the builtin "~/" to the path defined in ENV["HOME"]
      File.expand_path(@payload.metadata[:path] || DEFAULT_DOTFILES_PATH)
    end

    def dest_path(options = {})
      # File::expand_path convert the builtin "~/" to the path defined in ENV["HOME"]
      File.expand_path(options[:dest] || ::HFAM::HOME)
    end
  end
end