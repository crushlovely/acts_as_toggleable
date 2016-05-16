class Article < ActiveRecord::Base
  acts_as_toggleable :visible, :inverse_scope_name => :hidden
end
