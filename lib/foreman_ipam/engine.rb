module ForemanIpam
  class Engine < ::Rails::Engine
    engine_name 'foreman_ipam'

    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/overrides"]

    # Add any db migrations
    initializer 'foreman_ipam.load_app_instance_data' do |app|
      ForemanIpam::Engine.paths['db/migrate'].existent.each do |path|
        app.config.paths['db/migrate'] << path
      end
    end

    initializer 'foreman_ipam.register_plugin', :before => :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_ipam do
        requires_foreman '>= 1.16'

        # Add menu entry to Infrastructure
        menu :top_menu, :template,
          url_hash: { 
            controller: :'foreman_ipam/dashboard', action: :ipam 
          },
          caption: 'IPAM Dashboard',
          parent: :infrastructure_menu
      end
    end

    # Include concerns in this config.to_prepare block
    config.to_prepare do
      begin
        Dashboard.send(:include, ForemanIpam::DashboardExtensions)
        DashboardHelper.send(:include, ForemanIpam::DashboardHelperExtensions)
      rescue => e
        Rails.logger.warn "foreman_ipam: skipping engine hook (#{e})"
      end
    end

    rake_tasks do
      Rake::Task['db:seed'].enhance do
        ForemanIpam::Engine.load_seed
      end
    end

    initializer 'foreman_ipam.register_gettext', after: :load_config_initializers do |_app|
      locale_dir = File.join(File.expand_path('../../..', __FILE__), 'locale')
      locale_domain = 'foreman_ipam'
      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
    end
  end
end
