module RedmineAds
  module Hooks
    class LayoutHooks < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        return stylesheet_link_tag("redmine_ads.css", :plugin => 'redmine_ads', :media => 'screen')
      end
      
      def view_layouts_base_sidebar(context={})
        ad_list = Setting.plugin_redmine_ads['ads']
        return '' if ad_list.blank?

        ads = ad_list.split('---')

        picked_ad =  ads[Kernel.rand(ads.size)]

        return content_tag(:div,
                           picked_ad,
                           :class => 'redmine_ads')
      end
    end
  end
end
