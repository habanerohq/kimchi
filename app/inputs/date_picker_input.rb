class DatePickerInput < SimpleForm::Inputs::DateTimeInput
  # extends ....................................................................
  # includes ...................................................................

  include Inputs::Graspable

  # class methods ..............................................................
  # instance methods ...........................................................

  def input
    text_field << date_select << javascript
  end

  # protected instance methods .................................................

  protected

  def date_select
    @builder.send(:date_select, attribute_name, input_options,
                  input_html_options.except(:data))
  end

  def text_field
    @builder.send(:text_field, attribute_name, input_html_options)
  end

  def javascript
    template.javascript_tag(<<-JS.html_safe)
      $(function() {
        var input = $("input[data-handle='#{handle}']");

        input.siblings(":input").remove().end()
             .show()
             .datepicker({
               format: "yyyy-mm-dd",
               weekStart: 1,
               autoclose: true
             });
      });
    JS
  end
end
