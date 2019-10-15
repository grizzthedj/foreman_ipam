
module ForemanIpam
  class DashboardController < ::DashboardController
    def ipam
      @response = Phpipam.proxy.get_sections
    end

    def subnets
      @subnets = Phpipam.proxy.get_subnets_by_section(params[:section_name])
      render :json => @subnets.to_json, :status => :ok
    end
  end
end
