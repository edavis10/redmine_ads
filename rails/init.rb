require 'redmine'


require 'redmine_ads/hooks/layout_hooks'

Redmine::Plugin.register :redmine_ads do
  name 'Redmine Ads'
  author 'Eric Davis'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author_url 'http://www.littlestreamsoftware.com'
  description 'Redmine ads shows randomized ads in the Redmine sidebar.'
  version '0.1.0'

  requires_redmine :version_or_higher => '0.8.0'

  settings(:partial => 'settings/ads',
           :default => {
             'ads' => ''
           })

end
