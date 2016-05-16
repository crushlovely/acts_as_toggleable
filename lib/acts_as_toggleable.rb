require 'active_record'
require 'active_support/core_ext/array/extract_options'
require 'acts_as_toggleable/active_record/acts/toggleable'

module ActsAsToggleable
  if defined?(Rails::Railtie)
    class Railtie < Rails::Railtie
      initializer 'acts_as_toggleable.insert_into_active_record' do
        ActiveSupport.on_load :active_record do
          ActiveRecord::Base.send(:include, ActiveRecord::Acts::Toggleable)
        end
      end
    end
  elsif defined?(ActiveRecord)
    ActiveRecord::Base.send(:include, ActiveRecord::Acts::Toggleable)
  end
end
