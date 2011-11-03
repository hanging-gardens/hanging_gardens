module HangingGardens
  
  require 'tilt'
  require 'sprockets'
  require "hanging_gardens/version"
  require "hanging_gardens/module_wrapper"
  
  def self.register(env)
    env.register_engine '.common', ModuleWrapper
    env.append_path     File.expand_path('../../runtime', __FILE__)
  end
  
end
