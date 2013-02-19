module Controllers
  module Authenticate
    extend ActiveSupport::Concern

    included do
      before_filter :authenticate_user!
    end
  end
end
