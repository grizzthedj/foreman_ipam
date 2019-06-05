
module ForemanIpam
  class PhpipamClient
    def self.proxy
      ProxyAPI::Ipam.new({:url => SmartProxy.first[:url]})
    end
  end
end