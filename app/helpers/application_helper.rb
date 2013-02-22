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
end
