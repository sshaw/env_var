module EnvVar
  module W
    def self.[](name)
      EnvVar[name] ? EnvVar[name].split(",") : []
    end
  end

  module I
    def self.[](name)
      v = W[name]
      v.empty? ? v : v.map(&:to_sym)
    end
  end

  class << self
    def I(name)
      I[name]
    end

    alias i I

    def W(name)
      W[name]
    end

    alias w W

    def enabled?(name)
      %w[1 true on].freeze.include?(self[name])
    end

    def disabled?(name)
      %w[0 false off].freeze.include?(self[name])
    end

    def [](name)
      ENV[name]
    end

    def method_missing(name, *args)
      return ENV.public_send(name, *args) if ENV.respond_to?(name)
      super
    end

    def respond_to_missing?(name, all)
      ENV.respond_to?(name, all) || super
    end
  end
end
