
module ForemanPhpipam
  class DashboardController < ::DashboardController
    def phpipam
      @response = PhpipamClient.proxy.get_sections
    end

    def subnets
      @subnets = PhpipamClient.proxy.get_subnets(params[:section_id])
      render :json => @subnets.to_json, :status => :ok
    end
  end
end

