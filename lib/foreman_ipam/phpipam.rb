module ForemanIpam
  class Phpipam
    def self.proxy
      external_ipam_proxy = SmartProxy.with_features('external_ipam').first
      ProxyAPI::ExternalIpam.new({:url => external_ipam_proxy[:url]})
    end
  end
end