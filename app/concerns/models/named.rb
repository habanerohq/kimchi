module Models
  module Named
    extend ActiveSupport::Concern

    included do
      validates :name,
                :length => { :maximum => 255 },
                :presence => true
    end

    def to_s
      name.presence || name_was.presence || self.class.model_name.human
    end
  end
end
