require 'spec_helper'

<% module_namespacing do -%>
describe <%= class_name %> do
  subject { FactoryGirl.build(:<%= singular_table_name %>) }
  pending "add some examples to (or delete) #{__FILE__}"
end
<% end -%>
