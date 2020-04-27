class BaseOperation
    def self.call(*args, **kwargs, &block)
        new.(*args, **kwargs, &block)
    end
end
