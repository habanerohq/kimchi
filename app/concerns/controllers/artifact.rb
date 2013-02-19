module Controllers
  module Artifact
    extend ActiveSupport::Concern

    protected

    def build_resource(*args)
      memoize_resource do
        super.tap { |r| r.creator ||= current_user }
      end
    end
  end
end
