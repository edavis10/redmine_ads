require File.dirname(__FILE__) + '/../../../../test_helper'

class RedmineAds::Hooks::LayoutHooksTest < Test::Unit::TestCase
  include Redmine::Hook::Helper

  def controller
    @controller ||= ApplicationController.new
    @controller.response ||= ActionController::TestResponse.new
    @controller
  end

  def request
    @request ||= ActionController::TestRequest.new
  end

  def hook(args={})
    call_hook :view_layouts_base_sidebar, args
  end
    
  context "#view_layouts_base_sidebar" do
    context 'with no ads' do
      should 'display nothing' do
        Setting.plugin_redmine_ads = {'ads' => ''}

        response = hook
        assert response.blank?
      end
    end

    context 'with one ad' do
      should 'display the ad' do
        Setting.plugin_redmine_ads = {'ads' => 'this is one ad'}

        response = hook

        assert !response.blank?
        assert_match /this is one ad/, response
      end
    end

    context 'with multiple ads' do
      setup do
        Setting.plugin_redmine_ads = {'ads' => 'this is one ad\n---\nthis is another ad'}
      end
      
      should 'split the ads on "---"' do
        response = hook

        assert !response.blank?
        assert_match /this is (one|another) ad/, response
      end

      should 'randomly show an ad' do
        Kernel.expects(:rand).with(2).returns(0)

        response = hook

        assert !response.blank?
        assert_match /this is one ad/, response

      end
    end
  end
end
