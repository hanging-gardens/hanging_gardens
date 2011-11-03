class HangingGardens::ModuleWrapper < Tilt::Template
  RE_REQUIRE = /(?:\s+|(?:[=]\s*)|(?:^\s*))require\s*\((.+)\)/
  
  SANDBOX = %w(
    module
    exports
    require
    window
    document
    console
    screen
    history
    location
    navigartor
    __filename
    __dirname
    setInterval
    setTimeout
    clearInterval
    clearTimeout
  )
  
  self.default_mime_type = "application/javascript"
  
  def prepare
  end
  
  def evaluate(context, locals, &block)
    context.require_asset 'hanging_gardens/runtime.js'
    unless context.logical_path == 'browser/console' or context.logical_path == 'browser/window'
      context.require_asset 'browser/console' 
    end
    
    data.scan(RE_REQUIRE) do |m|
      path = YAML.load(m.first)
      if path[0,2] == './' or path[0,3] == '../'
        path = File.join(File.dirname(context.logical_path), path)
      end
      context.require_asset path
    end
    
    "HG.register(#{context.logical_path.inspect}, function(#{SANDBOX.join(', ')}){\n#{data}\n});\n"
  end
  
end