# module SimpleForm
#   module Inputs
#     class Base
#       def input_html_options
#         @input_html_options.reverse_merge!({ "ng-model" => "#{@builder.lookup_model_names.join(".")}.#{self.attribute_name}" })
#         @input_html_options
#       end
#     end
#   end
# end

module FormHelperExtends
  module ActionView
    module Helpers
      module FormHelper
        def form_for(record, options = {}, &block)
          if options[:validate]
            if ! options.key?(:url)
              options[:url] = ''
            end
            options.deep_merge!(html: {'client-side-validation': ''})
          end
          super(record, options, &block)
        end
      end
    end
  end
end

ActionView::Base.send(:include, FormHelperExtends::ActionView::Helpers::FormHelper)
