require File.expand_path('../spec_helper', __FILE__)

describe "Integration" do
  
  before do
    @env = Sprockets::Environment.new(File.expand_path('spec'))
    @env.append_path 'assets'
    HangingGardens.register(@env)
  end
  
  it "processes index.js.common" do
    asset = @env.find_asset('index')
    asset.should_not be_nil
    asset.to_s.should include('function helper')
    asset.to_s.should include('function fader')
    File.open('spec/assets/build.js', 'w+') { |f| f.write asset.to_s }
  end
  
end