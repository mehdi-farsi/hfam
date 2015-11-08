module HFAM
  class Payload < Hash
    
    def initialize
      super

      self[:metadata] = Hash.new
      self[:commands] = Array.new { |value| [:unknown, value] }
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