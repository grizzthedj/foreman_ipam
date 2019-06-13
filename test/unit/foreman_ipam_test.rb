require 'test_plugin_helper'

class ForemanIpamTest < ActiveSupport::TestCase
  test 'ensure proxy responds correctly to has_feature?' do
    proxy = FactoryBot.build(:ipam_smart_proxy)
    assert proxy.has_feature?('External IPAM')
  end
end
