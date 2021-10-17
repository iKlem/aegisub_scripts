local tr = aegisub.gettext

script_name = tr"Trim spaces & EOL"
script_description = tr"Trim spaces at start/end of sentence, trim spaces around EOL and remove trailing EOL"
script_author = "Clément 'iKlem' Delalande"
script_version = "0.1.0"

function trim_spaces( subtitles, selected_lines, active_line )
	local find_start_spaces = "^%s+"
	local find_trailing_spaces = "%s+$"
	local find_EOL_n_lowercase_with_spaces = " *\\n *"
	local find_EOL_n_uppercase_with_spaces = " *\\N *"
	local find_trailing_EOL = "\\N$"

	for i=1, #selected_lines do
		sub_line = subtitles[selected_lines[i]]
		-- REMOVE START SPACES
		text = string.gsub( sub_line.text, find_start_spaces, "" )
		-- REMOVE TRAILING SPACES
		text = string.gsub( text, find_trailing_spaces, "" )
		-- REMOVE SPACES BETWEEN "\N"
		text = string.gsub( text, find_EOL_n_lowercase_with_spaces, "\\N" )
		text = string.gsub( text, find_EOL_n_uppercase_with_spaces, "\\N" )
		-- REMOVE TRAILING "\N"
		text = string.gsub( text, find_trailing_EOL, "" )
		-- aegisub.debug.out( "revamp:" .. text .. "(end of string)\n" )
		if text ~= "" then
			sub_line.text = text
			subtitles[selected_lines[i]] = sub_line
		end
	end
	aegisub.set_undo_point( script_name )
end

aegisub.register_macro( script_name, script_description, trim_spaces )
