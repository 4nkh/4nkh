class ApplicationConfiguration < ActiveSupport::OrderedOptions

    def load
      common_file = "#{Rails.root}/config/app_config/common.rb"
      if File.exist?(common_file)
        eval(File.read(common_file))
      end
      env_file = "#{Rails.root}/config/app_config/#{Rails.env}.rb"
      if File.exist?(env_file)
        eval(File.read(env_file))
      end
    end
    
    def reload!
      self.clear
      self.load
    end

    # allows defining of methods that use other configs
    # Usage in the file : 
    # AppConfig.setting = 'setting'
    # AppConfig.depending_setting {"#{AppConfig.setting}/other_setting'}
    def method_missing(method_name, *args, &block)
      if block_given?
        define_custom_method(method_name, block)
     else
        super
      end
    end

  private
  def define_custom_method(method_name, block)
    singleton_class = class << self
      self
    end

    singleton_class.send(:define_method, method_name) do |&other_block|
      if(other_block)
        define_custom_method(method_name, other_block)
      else
        block.call
      end
    end
  end
 
end

::AppConfig = ApplicationConfiguration.new
AppConfig.load

