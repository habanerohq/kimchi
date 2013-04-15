module ResourcesHelper
  # url helpers ................................................................

  def create_or_update_resource_path(object)
    object.persisted? ? edit_resource_path(object) : collection_path
  end

  def cancel_path
    collection_path
  end

  # form builder stuff .........................................................

  def simple_form_for(object, options={}, &block)
    options.reverse_merge! :builder => FormBuilder,
                           :url => create_or_update_resource_path(object)

    super(object, options, &block)
  end

  class FormBuilder < SimpleForm::FormBuilder
    def actions
      template.render :partial => 'form_actions',
                      :locals => { :f => self }
    end
  end

  # localisation ...............................................................

  def localised_resource_name
    resource_class.model_name.human
  end

  def localised_collection_name
    # TODO: confirm the use of #titleize for #localised_collection_name
    resource_class.model_name.plural.titleize
  end

  alias_method :localized_resource_name, :localised_resource_name
  alias_method :localized_collection_name, :localised_collection_name

  # buttons ....................................................................

  def new_resource_button(*args)
    options = args.extract_options!
    options.reverse_merge! :class => 'btn btn-success'

    link_to((args.first || new_resource_path), options) do
      content_tag(:i, nil, :class => 'icon-plus-sign') << ' ' <<
        new_resource_button_text
    end
  end

  def new_resource_button_text
    object_name = resource_class.name.underscore

    translate("helpers.button.#{object_name}.new",
              :model => localised_resource_name,
              :default => [
                :'helpers.button.new',
                "New #{localised_resource_name}" ])
  end
end