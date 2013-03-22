module DecoratedHelper
  extend ActiveSupport::Concern

  included do
    alias_method_chain :collection, :decorator
    alias_method_chain :resource, :decorator
  end

  def collection_with_decorator
    @_decorated_collection ||=
      decorator_class.decorate_collection(collection_without_decorator)
  end

  def resource_with_decorator
    @_decorated_resource ||=
      decorator_class.decorate(resource_without_decorator)
  end
end
