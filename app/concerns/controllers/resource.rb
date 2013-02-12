module Controllers
  module Resource
    extend ActiveSupport::Concern

    included do
      include SuperResources::Controller
    end
  end
end
