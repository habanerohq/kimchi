module Controllers
  module Paginated
    extend ActiveSupport::Concern

    protected

    def page_param_name
      :page
    end

    def current_page
      params[page_param_name]
    end

    def per_page
      resource_class.default_per_page
    end

    def collection
      memoize_collection { super.page(current_page).per(per_page) }
    end
  end
end
