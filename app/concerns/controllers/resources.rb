module Controllers
  module Resources
    extend ActiveSupport::Concern
    include SuperResources::Controller

    included do
      helper :resources
    end

    module ClassMethods
      def parent_prefixes
        @parent_prefixes ||= %w(resources) + super
      end
    end
  end
end
