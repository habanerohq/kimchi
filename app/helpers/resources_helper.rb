module ResourcesHelper
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
