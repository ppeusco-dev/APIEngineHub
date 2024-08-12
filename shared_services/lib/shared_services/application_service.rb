module SharedServices
  class ApplicationService
    def self.call(*args, &block)
      new(*args, &block).call
    end

    # Métodos comunes o utilidades
    def success_response(data)
      Struct.new(:success?, :data).new(true, data)
    end

    def failure_response(error)
      Struct.new(:success?, :data).new(false, { error: error })
    end
  end
end
