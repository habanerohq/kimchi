module Models
  module Artifact
    extend ActiveSupport::Concern

    included do
      belongs_to :creator,
                 :class_name => 'User'
    end
  end
end
