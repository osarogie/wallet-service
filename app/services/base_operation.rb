class BaseOperation
    def self.call(*args, **kargs, &block)
        new.(*args, **kargs, &block)
    end
end