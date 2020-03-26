module RedmineOmgEssence::Hooks

  class RedmineOmgEssenceHookListener < Redmine::Hook::ViewListener
    include ActionView::Helpers::TagHelper

    def view_layouts_base_html_head(context)
      stylesheet_link_tag(:redmine_omg_essence, :plugin => 'redmine_omg_essence')
    end
  end

end
