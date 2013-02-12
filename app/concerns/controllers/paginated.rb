module Controllers
  module Paginated
    extend ActiveSupport::Concern

    included do
      has_scope :page, :default => 1
    end
  end
end
