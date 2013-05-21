module Inputs
  module Graspable
    extend ActiveSupport::Concern

    def input_html_options
      super.tap { |h| (h[:data] ||= {}).merge!(:handle => handle) }
    end

    protected

    def handle
      @_handle ||=
       [ self.class.name.underscore.dasherize,
         (Time.now.to_i + rand(255)).to_s(36) ].join('-')
    end
  end
end