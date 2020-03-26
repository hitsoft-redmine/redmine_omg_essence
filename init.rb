plugin_name = :redmine_omg_essence

Rails.configuration.to_prepare do
  %w{es hooks}.each do |file_name|
    require_dependency "#{plugin_name}/#{file_name}"
  end
end

Redmine::Plugin.register plugin_name do
  name 'Redmine Omg Essense plugin'
  author 'Konstantin Borisov'
  description 'This is a plugin for Redmine with wiki macros that shows OMG Essence concepts icons'
  version '0.0.1'
  url 'https://github.com/hitsoft-redmine/redmine_omg_essence'
  author_url 'https://github.com/smeagol74'
end

