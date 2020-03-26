module RedmineOmgEssence::Es
  Redmine::WikiFormatting::Macros.register do
    desc "Add Essence icon. Examples:

{{es(alpha)}} — generic alpha icon
{{es(alpha, size=2)}} — generic alpha of 2x size
{{es(alpha, customer, size=2}} — customer area alpha of 2x size

Available areas: customer, solution, endeavor.
Available icons: activity, activity_space, alpha, area, competency, pattern, practice, resource, state, work_product."
    macro :es do |obj, args|
      args, options = extract_macro_options(args, :size, :area)
      options[:size] = options[:size].to_i if options[:size].present?
      if args.empty?
        raise 'This macro can\'t be called with no argument.'
      else
        _icon = args.shift
        _area = ''
        unless args.empty?
          _area = "-#{args.shift}"
        end
        _size = ''
        if options[:size].present?
          _size = "es-#{options[:size]}x"
        end

        _content = "<i class=\"es es-#{_icon}#{_area} #{_size}\"></i>"
        _result = "#{ CGI::unescapeHTML(_content) }".html_safe
        return _result
      end
    end
  end
end