local tr = aegisub.gettext

script_name = tr"To lower case the first letter"
script_description = tr"Put to lower case the first letter of lines (since there's no upper case in japanese)"
script_author = "Clément 'iKlem' Delalande"
script_version = "0.3.0"

function toLowerCase(subtitles, selected_lines, active_line)
	local patternToLower = "({.*})(%u)( ?[%l]?)([^%u].*)"
	local text, tag, upper, lower
	local subLine

	for i=1, #selected_lines do
		subLine = subtitles[selected_lines[i]]

		text = ""
		for tag, upper, lower, remainder in subLine.text:gmatch( patternToLower ) do
			if lower ~= nil then
					upper = string.lower( upper )
					text = tag .. upper .. lower .. remainder
			end
		end

		if text ~= "" then
			subLine.text = text
			subtitles[selected_lines[i]] = subLine
		end
	end

	aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, toLowerCase)
