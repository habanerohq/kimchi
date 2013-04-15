module Controllers
  module Filtering
    extend ActiveSupport::Concern

    included do
    end

    def filter
      @collection = collection.basic_search(params[:filter]) unless params[:filter].blank?
    end

    module ClassMethods
      def parent_prefixes
        @parent_prefixes ||= %w(filtering) + super
      end
    end
  end
end