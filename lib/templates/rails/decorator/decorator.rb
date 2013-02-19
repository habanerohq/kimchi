<%- module_namespacing do -%>
  <%- if parent_class_name.present? -%>
class <%= class_name %>Decorator < <%= parent_class_name %>
  <%- else -%>
class <%= class_name %>
  <%- end -%>
  include Decorators::Resource
  include Decorators::Tabled

  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
<% end -%>
