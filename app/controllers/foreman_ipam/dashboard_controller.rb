
module ForemanIpam
  class DashboardController < ::DashboardController
    def ipam
      begin
        @response = Phpipam.proxy.get_sections
      rescue => e
        flash.now[:notice] = e.message
      end 
    end

    def subnets
      begin
        @subnets = Phpipam.proxy.get_subnets_by_section(params[:section_name])
      rescue => e
        flash.now[:notice] = e.message
      end
      render :json => @subnets.to_json, :status => :ok
    end
  end
end
