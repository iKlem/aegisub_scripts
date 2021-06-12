local tr = aegisub.gettext

script_name = tr"lowercase_firstletter"
script_description = tr"Put to lower case the first letter of lines (since there's no upper case in japanese)"
script_author = "Clément 'iKlem' Delalande"
script_version = "0.1.0"

function toLowerCase(subtitles, selected_lines, active_line)
	for i=1, #selected_lines do
		local subLine = subtitles[selected_lines[i]]
		subLine.text = string.lower(subLine.text)
		subtitles[selected_lines[i]] = subLine
	end

	aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, toLowerCase)
