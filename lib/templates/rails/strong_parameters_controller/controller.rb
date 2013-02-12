<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  include Controllers::Resource
  include Controllers::Paginated
  include Controllers::Decorated

  protected

  def resource_params
    params.require(:<%= singular_table_name %>).permit(<%= attributes.map {|a| ":#{a.name}" }.sort.join(', ') %>)
  end
end
<% end -%>
