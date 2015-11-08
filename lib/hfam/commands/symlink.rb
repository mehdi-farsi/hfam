require "fileutils"

module HFAM
  module Command
    class Symlink < Base

      def run(command)
        src  = command[1]

        ::HFAM::Logger.error("No such file or directory: #{src}") and return unless File.exist? src

        # preprend the dest file with a '.' if the src file is not a hidden file 
        file = src.split('/').last
        file = ::FileUtils.hidden_file?(file) ? file : ".#{file}"
        dest = command[2] || "#{::HFAM::HOME}/#{file}"

        
        # ln -s with --force option
        ::FileUtils.ln_sf(src, dest)

        ::HFAM::Logger.success("Symlink: ln -s #{src} #{dest}")

      rescue ::Errno::EACCES => e
        l::HFAM::Logger.error("Unable to generate symlink #{src} #{dest} (Permission Denied)")
      end

    end
  end
end