class Story < ActiveRecord::Base
  acts_as_toggleable :publishable, :inverse_scope_name => :unpublishable
  acts_as_toggleable :featured, :scope_name => :features
end
