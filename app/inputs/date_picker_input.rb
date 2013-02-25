class DatePickerInput < SimpleForm::Inputs::DateTimeInput
  def input
    text_field << date_select << javascript
  end

  protected

  def date_select
    @builder.send(:date_select, attribute_name, input_options, input_html_options)
  end

  def text_field
    @text_field ||=
      @builder.send(:text_field, attribute_name, input_html_options)
  end

  def text_field_id
    text_field.match(/id=\"([^\"]+)\"/).captures.first
  end

  def javascript
    template.javascript_tag(<<-JS.html_safe)
      (function() {
        var input = $("\##{text_field_id}"); 

        input.siblings(":input").remove().end()
             .show()
             .datepicker({
               format: "yyyy-mm-dd",
               weekStart: 1,
               autoclose: true
             });
      })();
    JS
  end
end
