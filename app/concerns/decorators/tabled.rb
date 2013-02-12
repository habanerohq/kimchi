module Decorators
  module Tabled
    extend ActiveSupport::Concern

    module ClassMethods
      def column_names
        source_class.attribute_names - %w(id created_at updated_at)
      end
    end
  end
end
