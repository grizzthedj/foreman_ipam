
module ForemanIpam
  class PhpipamClient
    def self.proxy
      ProxyAPI::ExternalIpam.new({:url => SmartProxy.first[:url]})
    end
  end
end