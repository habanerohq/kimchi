module Controllers
  module Decorated
    extend ActiveSupport::Concern

    included do
      helper :decorated
      helper_method :decorator_class
    end

    protected

    def decorator_class
      resource_class.decorator_class
    end
  end
end
