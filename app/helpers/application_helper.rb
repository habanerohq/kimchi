module ApplicationHelper
  def application_name
    t('application.name', :default =>
      Rails.application.class.parent.name.to_s.demodulize.humanize)
  end

  def tab_to(*args, &block)
    options = args.extract_options!
    options[:class] =
      current_page?(*(block_given? ? args : (args.drop(1)))) ? "active" : nil

    content_tag(:li, link_to(*args << options, &block), options)
  end

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
end
