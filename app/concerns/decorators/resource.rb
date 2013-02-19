module Decorators
  module Resource
    extend ActiveSupport::Concern
    alias_method :resource, :source

    def resource_class
      self.class.source_class
    end
  end
end
