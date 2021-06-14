local tr = aegisub.gettext

script_name = tr"To lower case the first letter"
script_description = tr"Put to lower case the first letter of lines (since there's no upper case in japanese)"
script_author = "Clément 'iKlem' Delalande"
script_version = "0.4.0"

function toLowerCase(subtitles, selected_lines, active_line)
	local patternToLower = "^({\\[%g]*})(\"?“?)(%u)( ?[%l]?)([^%u].*)"
	local patternToLowerFallback = "^({\\[%g]*})(%u)( ?[%l]?)([^%u].*)"
	local text, tag, quote, upper, lower, remainder
	local subLine

	for i=1, #selected_lines do
		subLine = subtitles[selected_lines[i]]

		text = ""
		tag, quote, upper, lower, remainder = string.match( subLine.text, patternToLower )
		if tag == nil then
			tag, upper, lower, remainder = string.match( subLine.text, patternToLowerFallback )
			if tag~= nil then
				text = tag .. string.lower( upper ) .. lower .. remainder
				aegisub.debug.out("FALLBACK\n")
				aegisub.debug.out("tag:" .. tag .. "\n")
			end
		else
			aegisub.debug.out("tag:" .. tag .. "\n")
			text = tag .. quote .. string.lower( upper ) .. lower .. remainder
		end

		if quote ~= nil then
			aegisub.debug.out("quote:" .. quote .. "\n")
		end
		if upper ~= nil then
			aegisub.debug.out("upper:" .. upper .. "\n")
		end
		if lower ~= nil then
			aegisub.debug.out("lower:" .. lower .. "\n")
		end
		if remainder ~= nil then
			aegisub.debug.out("remainder:" .. remainder .. "\n")
		end

		if text ~= "" then
			subLine.text = text
			subtitles[selected_lines[i]] = subLine
		end
	end

	aegisub.set_undo_point( script_name )
end

aegisub.register_macro( script_name, script_description, toLowerCase )
