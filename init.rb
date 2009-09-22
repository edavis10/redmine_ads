require 'redmine'


require 'redmine_ads/hooks/layout_hooks'

Redmine::Plugin.register :redmine_ads do
  name 'Redmine Ads plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'

  settings(:partial => 'settings/ads',
           :default => {
             'ads' => ''
           })

end
