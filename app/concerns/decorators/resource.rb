module Decorators
  module Resource
    extend ActiveSupport::Concern

    included do
      alias_method :resource, :source
    end

    def resource_class
      self.class.source_class
    end
  end
end
