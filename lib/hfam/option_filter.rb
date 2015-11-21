module HFAM
  module OptionFilter
    def filter
      blocking_flag = false

      case true
      when @payload.help_option?
        puts @payload.help_message
        exit(1)
      when @payload.version_option?
        puts @payload.version_message
        exit(1)
      end # case/when
    end
  end 
end