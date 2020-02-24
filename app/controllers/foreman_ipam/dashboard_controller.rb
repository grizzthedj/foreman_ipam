require 'uri'

module ForemanIpam
  class DashboardController < ::DashboardController
    def ipam
      begin
        @response = Phpipam.proxy.get_groups
      rescue => e
        flash.now[:notice] = e.message
      end 
    end

    def subnets
      begin
        @subnets = Phpipam.proxy.get_subnets_by_group(URI.escape(params[:group]))
      rescue => e
        flash.now[:notice] = e.message
      end
      render :json => @subnets.to_json, :status => :ok
    end
  end
end
