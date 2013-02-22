module Controllers
  module Resources
    extend ActiveSupport::Concern

    included do
      include SuperResources::Controller
      helper :resources
    end

    module ClassMethods
      def parent_prefixes
        @parent_prefixes ||= %w(resources) + super
      end
    end
  end
end
