
module ForemanIpam
  class DashboardController < ::DashboardController
    def ipam
      begin
        @response = Phpipam.proxy.get_sections
      rescue
        @response = nil
      end 
    end

    def subnets
      begin
        @subnets = Phpipam.proxy.get_subnets_by_section(params[:section_name])
      rescue
        @subnets = nil
      end
      render :json => @subnets.to_json, :status => :ok
    end
  end
end
