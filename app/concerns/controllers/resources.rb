module Controllers
  module Resources
    extend ActiveSupport::Concern

    included do
      include SuperResources::Controller
    end
  end
end
