module ResourcesHelper
  def render_table(collection, options={})
    klass_name =
      options[:resource_class].to_s.classify.presence ||
      collection.any? ? collection.first.class :
      controller.send(:resource_class)

    klass = klass_name.to_s.safe_constantize
    options.reverse_merge! :resource_class => klass,
                           :column_names => klass.decorator_class.column_names

    render :partial => 'table', :locals => options.merge(:collection => collection)
  end

  def simple_form_for(record, options={}, &block)
    options.reverse_merge! :builder => FormBuilder
    super(record, options, &block)
  end

  class FormBuilder < SimpleForm::FormBuilder
    def actions
      template.render :partial => 'form_actions',
                      :locals => { :f => self }
    end
  end
end
