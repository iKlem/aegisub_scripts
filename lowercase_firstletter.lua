local tr = aegisub.gettext

script_name = tr"lowercase_firstletter"
script_description = tr"Put to lower case the first letter of lines (since there's no upper case in japanese)"
script_author = "Clément 'iKlem' Delalande"
script_version = "0.1.0"

function toLowerCase(subtitles, selected_lines, active_line)
	aegisub.debug.out("Hello World")
	aegisub.debug.out(subtitles.n .. " and " .. #subtitles .. " should be the same value")
	aegisub.debug.out(subtitles[selected_lines[1]].raw)
	aegisub.debug.out(subtitles[selected_lines[1]].class)
end

aegisub.register_macro(script_name, script_description, toLowerCase)
