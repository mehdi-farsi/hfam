module HFAM
  class Payload < Hash
    
    def initialize
      super

      self[:metadata] = Hash.new
      self[:commands] = Array.new { |value| [:unknown, value] }
    end

    def help_option?
      !!metadata[:help]
    end

    def help_message
      metadata[:help]
    end

    def version_option?
      !!metadata[:version]
    end

    def version_message
      metadata[:version]
    end

    def metadata
      self[:metadata]
    end

    def metadata=(h)
      self[:metadata] = h.dup
    end

    def commands
      self[:commands]
    end

  end
end