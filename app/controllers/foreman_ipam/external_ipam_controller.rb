module ForemanIpam
  class ExternalIpamController < ::DashboardController
    def dashboard
      begin
        ipam_proxies = SmartProxy.with_features('External IPAM')
        first_id = ipam_proxies.first.id
        @response = {}
        ipam_proxies.each do |proxy|
          external_ipam_proxy = ProxyAPI::ExternalIpam.new({:url => proxy[:url]})
          @response[proxy.name] = {
            id: proxy.id,
            first: proxy.id == first_id,
            groups: external_ipam_proxy.get_groups
          }
        end
      rescue => e
        flash.now[:notice] = e.message
      end
    end

    def subnets
      begin
        proxy = SmartProxy.find(params[:smart_proxy_id])
        external_ipam_proxy = ProxyAPI::ExternalIpam.new({:url => proxy[:url]})
        @subnets = external_ipam_proxy.get_subnets_by_group(params[:group])
      rescue => e
        flash.now[:notice] = e.message
      end
      render :json => @subnets.to_json, :status => :ok
    end
  end
end
