require 'rails/generators/erb/scaffold/scaffold_generator'

module Kimchi
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      def self.source_root
        File.expand_path(File.join(*%w(.. templates)), __FILE__)
      end

      protected

      def available_views
        %w(show _form _table)
      end
    end
  end
end
