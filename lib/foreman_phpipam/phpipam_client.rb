
module ForemanPhpipam
  class PhpipamClient
    def self.proxy
      ProxyAPI::Phpipam.new({:url => SmartProxy.first[:url]})
    end
  end
end