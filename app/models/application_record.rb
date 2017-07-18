class ApplicationRecord < ActiveRecord::Base
  include DewSet::Tools
  self.abstract_class = true
end
