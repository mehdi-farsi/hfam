require "fileutils"
require "pathname"

module HFAM
  module Command
    class Source < Base

      def run(command)
        src  = command[1]

        ::HFAM::Logger.error("No such file or directory: #{src}") and return unless File.exist? src

        # preprend the dest file with a '.' if the src file is not a hidden file 
        file = src.split('/').last
        file = ::FileUtils.hidden_file?(file) ? file : ".#{file}"
        dest = command[2] || "#{::HFAM::HOME}/#{file}"

        # https://wiki.ubuntu.com/DashAsBinSh#My_production_system_has_broken_and_I_just_want_to_get_it_back_up.21
        # Sometime the default shell /bin/sh is a symlink to another shell
        # Pathname#realpath permits to reach the target of a symlink 
        real_shell_path = ::Pathname.new(ENV['SHELL']).realpath.to_s

        # /bin/dash doesn't implement the builtin 'source'. Instead, it uses the '.' command
        cmd = real_shell_path.split('/').last == "dash" ? '.' : "source"

        (cmd = "#{real_shell_path} -c '#{cmd} #{dest}'") && result = `#{cmd}`

        ::HFAM::Logger.success("Source: Command result: #{result}")
        ::HFAM::Logger.success("Source: #{cmd}")

      rescue ::Errno::EACCES => e
        l::HFAM::Logger.error("Unable to source #{dest} (Permission Denied)")
      end

    end
  end
end