--[[	

	FileName: 				ZerkinzConfig.Functions.lua
	AddOn Name:				ZerkinzConfig

	Created & Coded by: 	Zerkinz of US-Illidan, aka Ryan "Rj" Perkins. 
	Contact	the Creator: 	RypeDesigns@Gmail.com

	Support/Donate/Suggest:	If you want to show your appreciation for my work, and/or want to inspire, encourage, and incentivize my time & energy (blood, sweat, and tears**) committed on: supporting (maintanence), updating (improvements), and expanding (create new things) my ever-expanding UI suite, comprised of, but not limited to:

		ZerkinzUI Pro	| ElvUI Profile,

		ZerkinzUI Pro	| SHA WeakAura Pack | Tri-Spec Support; custom-coded,
		ZerkinzUI Pro	| Mage WeakAura Pack | Arcane Rune-Styled Heads Up Display,

		ZerkinzConfig	| AddOn,
		ZerkinzMedia	| AddOn, 

		and more not listed here,
		and more to be created in the future..

]]--
--local addonName, nameSpace = ...;
--local ZerkinzAddonName, nameSpace = ...;

--_G[ZerkinzAddonName] = nameSpace; -- ZerkinzConfig
--_G[ZerkinzAddonName]['name'] = ZerkinzAddonName;

--[[
if	type( ZerkinzConfig ) == 'table' then 

	_G.__AccountProfile 	= (  pcall( rawget( ZerkinzConfig, '__AccountProfile' ) )		and		rawget( ZerkinzConfig, '__AccountProfile' )  )		or nil;		
	_G.__CharacterProfile 	= (  pcall( rawget( ZerkinzConfig, '__CharacterProfile' ) ) 	and		rawget( ZerkinzConfig, '__CharacterProfile' )  )	or nil;		

	if 	type(rawget(ZerkinzConfig, '__Profiles')) == 'table' then

		_G.__ProfilesAccount = ( pcall(rawget(ZerkinzConfig.__Profiles, 'Account'))  and  rawget(ZerkinzConfig.__Profiles, 'Account')  ) or nil;
		_G.__ProfilesCharacter = ( pcall(rawget(ZerkinzConfig.__Profiles, 'Character')) and rawget(ZerkinzConfig.__Profiles, 'Character')  ) or nil;

	end

end

ZerkinzConfig = ZerkinzConfig or {};
ZerkinzConfig.__Profiles = ZerkinzConfig.__Profiles or {};
ZerkinzConfig.__Profiles.Account = ZerkinzConfig.__Profiles.Account or {};
ZerkinzConfig.__Profiles.Character = ZerkinzConfig.__Profiles.Character or {};
]]


--local _G = _G;

local addonString 			= "ZERKiNZ|CONNFiG";
local addonNameShorthand	= 'ZERKiNZ.cfg';
local ScriptName			= 'ZerkinzConfig';

local fileName 				= 'functions.lua';
local fileTitle 			= 'Functions';




function AddOn_GetNameSpace(addonObject, NS)

	if type(addonObject) ~= 'table' and type(NS) ~= 'table'  then 
		return false;
	elseif type(addonObject) == 'table' and type(NS) ~= 'table' then
		return addonObject;
	elseif type(NS) == 'table' then	
	
		if type(addonObject) ~= 'table' then
			local AceAddon = _G['AceAddon'] or _ENV['AceAddon'] or NS['AceAddon'] or false;
			if AceAddon then
				addonObject = AceAddon:NewAddon(ZerkinzAddonName, 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0', 'AceHook-3.0');
				if	type(addonObject) ~= 'table' then
					return false;
				end
			end
		end

		for k,v in pairs(NS) do
			addonObject[k] = v;
		end
	end

end



function	is_type(var, varType)
	if	( var ~= (nil or '' or ' ') and ( type(varType) == 'string' ) and string.lower(tostring(type(var))) == tostring(string.lower(varType)) ) then
		return var, true, type(var);
	else
		return false, var, type(var)
	end
end

function is_boolean(b)
	if	type(b) == 'boolean' then
		return b, true, type(b);
	else
		return false, b, type(b);
	end
end

function is_number(n)
	if	type(n) == 'number' then
		return n, true, type(n);
	else
		return false, n, type(n);
	end
end

function is_string(s)
	if	type(s) == 'string' then
		return s, true, type(s);
	else
		return false, s, type(s);
	end
end

function is_function( f )
	--local type_input	= ( type(type_input) == "string" ) and ( string.lower(type_input) or "function" );
	--local input_type	= type(value_input);
	if	(	type(f) == 'function'   )	then 	--string.lower(input_type) == string.lower(lf_type) then
		return f, true, 'function';
	else
		return false, f, type(f);
	end
end

function is_table(t)
	if	type(t) == ('table' or 'userdata') then
		return t, true, 'table';
	else
		return false, t, type(t);
	end
end

function is_userdata(u)
	if	type(u) == ('userdata') then
		return u, true, 'userdata';
	else
		return false, u, type(t);
	end
end


function is_method(m)
	if	type(m) == 'function' then
		return m, true, 'function';
	else
		return false, m, type(m);
	end
end



--[[
function is_string(s)
	if type(s) == 'string' then
		return tostring(s);
	else
		return false;
	end
end
function is_table(t)
	if type(t) == 'table' then
		return t, true;
	else
		return false, t;
	end
end
]]--
--[[
function	is_table(value_input, type_input)

	local type_input	= ( type(type_input) == "string" ) and ( string.lower(type_input) or "table" );
	local input_type	= type(value_input);

	if	(	input_type == type_input	)	then 	--string.lower(input_type) == string.lower(lf_type) then
		return value_input, input_type, true;
	else
		return false, value_input, input_type;
	end

end
]]


--[==[
function table.tostring(t, seperator, include_keys, return_table)
	local t_tostring = {};
	local seperator = is_string(seperator) or ' ';
	local include_keys = ( include_keys and true ) or false;
	local string_format;
	local i;

	if	is_table(t)	then 

		for k,v in pairs(t) do
			i = ( i or 0 ) + 1;
			if	type(v) == ('table' or 'userdata')	then
				--v = foreach(v, tostring);
				v = is_table( foreach(v, tostring) ) or table.tostring(v);
			end

			if 	include_keys	then
				string_format = "[%s] = '%s'; ";
				v = string.format(string_format, k, v);
			else
				string_format = "%s";
				v = string.format(string_format, v);
			end			

			--local string_values = { k, v };
			--local string_value = string.format(string_format, unpack(string_values))
			rawset( t_tostring, k, v );
		end
		local t_string = ( pcall( table.concat(t_tostring, seperator) ) and is_string( table.concat(t_tostring, seperator) ) ) or false;
		return is_string(t_string), (return_table and is_table(t_tostring));
	else
		return false;
	end
end
]==]

--function cast(input, type)

--end

function table.tostring_all(t, overwrite_t)

	if	is_table(t)	then
		local _t;	

		if 	overwrite_t	then
			_t = t;
		else
			_t = {};
		end

		local last_key, last_val;

		for k,v in pairs(t) do

			if	overwrite_t	then
				if	last_key and last_val	then
					rawset(t, last_key, last_val);
				end
				last_key = k;
				last_val = v;
			else
				_t[k] = tostring(v);
			end

		end
		
		if	last_key and last_val then 
			rawset(t, last_key, last_val);
			return is_table(t) or false;
		else
			return is_table(_t) or false;
		end

	else
		return false;
	end
end

function table.tostring(t, return_as_string, seperator)

	if	is_table(t)  or  is_userdata(t)  then
		local _t = {};
		local seperator = is_string(seperator) or ' ';

		for k,v in pairs(t) do
			local v = rawget(t, k);
			if	is_table(v) or is_userdata(v)	then
				v = table.concat(table.tostring(v));
			end
			_t = rawset(_t, k, "['"..tostring(k).."'] = '"..tostring(v).."';");			
			--_t[k] = tostring(v);
		end
		
		local _t_string = ( return_as_string and pcall(table.concat(_t, seperator)) and is_string(table.concat(_t, seperator)) ) or false;

		if 	return_as_string  and  _t_string  then
			return _t_string;
		elseif return_as_string  and  not _t_string then
			return false;
		elseif	is_table(_t)  or  is_userdata(_t)	 then
			return _t;
		end
	else
		return false;
	end

end


function table.flip(tbl,key)

	local _t;

	if type(tbl) == 'table' then

		_t = {};

		for k,v in pairs(tbl) do

			if	type(key) == 'string'	then

				if	k == key then

					return v, k;

				end

			end

			_t[tostring(v)] = tostring(k);

		end

		return _t;

	else

		return false;

	end

end



function Console_GetType(commandType)

	local	commandTypes = {
		[0] = 'CVar';
		[1] = 'Command';
		[2] = 'Macro';
		[3] = 'Script';
		[4] = 'Unknown';
	};
	
	if commandType ~= nil and type(commandType) == 'number' then

		return commandTypes[tonumber(commandType)] or stringMatch(commandType, commandTypes, "v") or commandTypes[4], commandType;

	elseif type(commandType) == 'string' and string.len(commandType) > 1 then

		local	commandTypes_Flipped = table.flip(commandTypes);

		for key_commandType,val_cmdInt in pairs(commandTypes_Flipped) do

			if	string.lower(key_commandType)  ==  string.lower(commandType)  then
			
				return	( key_commandType or commandTypes_Flipped[tostring(commandType)] )  or commandTypes[4], commandType;

			end

		end

		return false, 4;

	else
		return false, 4;
	end

end



function Console_GetCategory(category)

	local	Categories = {
		[0] = 'Debug';
		[1] = 'Graphics';
		[2] = 'Console';
		[3] = 'Combat';
		[4] = 'Game';
		[5] = 'Default';
		[6] = 'Net';
		[7] = 'Sound';
		[8] = 'GM';
		[9] = 'Reveal';
		[10] = 'None';
	};
	
	if type(category) == 'number' then

		return Categories[tonumber(category)] or false, category;

	elseif type(category) == 'string' then

		local	Categories_Flipped = table.flip(Categories);
		return 	stringMatch(category, Categories_Flipped) or Categories_Flipped[tostring(category)] or false, category;

	else
		return false;
	end

end



function ConsoleCommands_GetCategory(command)

	local	Categories = {
				[0] = 'Debug';
				[1] = 'Graphics';
				[2] = 'Console';
				[3] = 'Combat';
				[4] = 'Game';
				[5] = 'Default';
				[6] = 'Net';
				[7] = 'Sound';
				[8] = 'GM';
				[9] = 'Reveal';
				[10] = 'None';
			};
	
	end


--[[
Returns

//	Commands
	Field			Type	Description
	command			unknown	
	help			unknown	
	category		unknown	
	commandType		unknown	
	scriptContents	unknown	
	scriptParams	unknown	
]]


--[[
//	Enum.ConsoleCategory
	Value	Field	Description
		0	Debug	
		1	Graphics	
		2	Console	
		3	Combat	
		4	Game	
		5	Default	
		6	Net	
		7	Sound	
		8	Gm	
		9	Reveal	
		10	None	
]]


--[[
//	Enum.ConsoleCommandType	table
	Value	Field	Description
		0	Cvar	
		1	Command	
		2	Macro	
		3	Script
]]




function table.copy(t1, t2)

	local t2 = ( type(t2) == 'table' and t2 ) or {};

	if	type(t1) == 'table'  and  type(t2) == 'table'  then	
		
		for k,v in pairs(t1) do
			rawset(t2, k, v);
			--t2[k] = v;
		end

		return t2, t1;
	else
		return false;
	end
end



function table.merge(t1, t2, new_table)

	local _t1, t1, t2, new_table = t1, t1, t2, new_table;
	local t3;

	if	'table' == ( type(t1) and type(t2) ) then

		for k,v in pairs(t2) do
			t1[k] = v;
		end

		if	new_table == true	then
			t3 = table.copy(t1, t3);
			return t3;
		else
			return t1;
		end
	
	else
		return false, t1, t2;
	end

end



--[=[
function table_tostring(t, character_limit)

	if type(t) == 'table' then
		
		local s;
		local s_length;
		local s_fragments;
		local keyval_s;
		local keyval_length;
		local _k;
		local _v;
		local character_limit = (type(character_limit) == 'number' and character_limit) or 255;
		local s_fragments_counter;
		local i;

		for k,v in pairs(t) do
			
			_k, _v = tostring(k), tostring(v);
			s_fragments_counter = (s_fragments_counter or 1);
			i = (i or 0) + 1;
			
			s = (s or '');
			s_length = string.len(s);

			keyval_s = "['".._k.."'] = '".._v.."';  ";
			keyval_length = string.len(keyval_s);

			if	s_length + keyval_length > character_limit then
				s_fragments_counter = ( s_fragments_counter or 0 ) + 1;
				s_fragments[s_fragments_counter] = ""..(s and tostring(s)).."";
				s_fragments[i] = ""..(s and tostring(s)).."";
				s = nil;
			else
				s = (s and tostring(s))..keyval_s;
			end
					
		end

		return s_fragments, select(1, s_fragments);

	else	--[[ ..	if	(( is_table(t) )) .. ]]--
		return false;
	end

end -- table_tostring();
]=]

function table_tostring(t, character_limit, return_format)

	if type(t) == 'table' then

		local s;
		local s_length;
		local s_fragments = {};
		local keyval_s;
		local keyval_length;
		local _k;
		local _v;
		local character_limit = (type(character_limit) == 'number' and character_limit) or 255;
		local s_wrapper = ("	[ %s ] = {\n%s};");
		local s_outtro = ' ...';
		local s_wrapper_length = string.len(s_wrapper) - 4;
		local s_fragments_counter = 0;
		local i;

		for k, v in pairs(t) do

			_k = (k and tostring(k));
			_v = (v and tostring(v));
			--s_fragments_counter = (s_fragments_counter or 1);
			i = (i or 0) + 1;

			s = (s or '');
			s_length = string.len(s);

			keyval_s = "[" .. tostring(i) .. "]	[" .. tostring(_k) .. "] = " .. tostring(_v) .. ";\n";
			keyval_length = string.len(keyval_s);

			if s_length + keyval_length > (character_limit - s_wrapper_length) then
				s = tostring("" .. (s and tostring(s)) .. "");
				s_fragments_counter = (s_fragments_counter or 0) + 1;
				s_fragments[s_fragments_counter] = string.format(s_wrapper, s_fragments_counter, s);
				s = nil;
			else
				s = (s and tostring(s or '')) .. keyval_s;
			end

		end
		
		if	( (is_number(s_fragments_counter) or 0) == (0 or nil or false) )  or  ( (is_number(s_fragments_counter) or 0) < 1 )  then
			return is_string(s);
		elseif return_format == 'unpack' then
			return unpack(s_fragments);
		elseif return_format == 'table' then
			return s_fragments;
		else
			return s_fragments, unpack(s_fragments);
		end
		
	else --[[ ..	if	(( is_table(t) )) .. ]] --
		return false;
	end

end -- table_tostring();


function repack(...)
	
	local t;
	local i;
	local ii;
	local arg_count = tonumber(select("#", ...)) or (type(arg) == 'table' and tonumber(#arg)) ;

	if arg_count > 0 then
	
		for i,v in ipairs({...} or arg) do
			
			ii = (i or ((ii or 0) + 1));
			t = t or {};
			t[i] = v;
			
		end

	end
		
	if type(t) == 'table' then
		return t, ii;
	else
		return false;
	end
	
end



function print_r(table, tableName, explored)
	local _G = _G;
	_G.explored = nil;

	if	type(table) == 'table' then
			local explored = explored or {};
			if	explored[(table and tostring(table))]	then
					print("// ALREADY SEARCHED: ", tableName or tostring(table));
					return false;
			else
					explored[(table and tostring(table))] = (table and tostring(table));
			end
			explored[(table and tostring(table))] = (table and tostring(table));
			print('|==========================================================|');
			print("|--[" .. tostring(tableName or table) .. "]:[Printing]--------------------------------------|\n|==========================================================|");
			print_r(table);
			for k,v in pairs(table) do
					local path = tostring(tableName or table) .. ":" .. tostring(k);
					if	type(v) == 'table' 	then
							print_r(v, tostring(path));
					else
					
						print("[[ "..tostring(k).." ]] == ['"..tostring(v).."'];")
						end
			end
			return true;
	end

end

function print_r(table, tableName, explored)

	local _table = table;
	local table;

	if	type(table) == 'table' then
	
			if	explored[tostring(_table)] then
					print('\n\n================================================\nERROR\009|\009Already explored table: ', tableName);
					return false;
			else
					table = rawget(table);
			end

	else
			print('\n\n================================================\nERROR\009|\009Failed to fetch table: ', tableName);
			return false;
	end
	
	print('\n=====\009rawget(table) == ', table);
	if	type(table) == 'table' then
			local explored = explored or {};
			if	explored[tostring(table)]	then
					print("// ALREADY SEARCHED: ", tableName or tostring(table));
					return false;
			else
					explored[tostring(table)] = tostring(table);
			end
			explored[tostring(table)] = tostring(table);
			print('|==========================================================|');
			print("|--[" .. tostring(tableName or table) .. "]:[Printing]--------------------------------------|\n|==========================================================|");
			arrayPrint(table);
			for k,v in pairs(table) do
					local path = tostring(tableName) .. ":" .. tostring(k);
					if	type(v) == 'table' 	then
							print_r(v, tostring(path));
					end
			end
			return true;
	end

end


----------------------------------------------
----------------------------------------------
--[[  ZERKINZ CHAT FUNCTIONS START HERE:  ]]--
----------------------------------------------
----------------------------------------------
--function ChatWindowExists()

function ChatFrameName_Int(i)
	if	type(i) == 'number'	then
		return 'ChatFrame'..tostring(i);
	else
		return false;
	end
end



function Chat_GetTabNames(s)

	local frameName;
	local frameObject;
	local frameTabObject;
	local frameTabName;
	local CHAT_TABS;

	for	i,frameName in pairs(CHAT_FRAMES) do

		--frameName		= ChatFrameName_Int(i);
		--frameObject		= _G[frameName];
		frameTabObject 	= _G[frameName..'Tab'];
		frameTabName	= is_string( is_table(frameTabObject) and frameTabObject:GetText() ) or GetChatWindowInfo(i);

		if	is_string(frameTabName) then
			CHAT_TABS[i] = frameTabName
		end

	end

	
	
end


function Chat_CreateWindow(newWindowName)

	local chatFrame;
	local chatFrameName;
	local chatWindowName;
	local chatWindowMatch;
	local windowFrameMatch;
	local frameIndexMatch;
	local windowExists; 

	if 	type(newWindowName) ~= 'string' or newWindowName == (nil or '' or ' ' or '  ') then
		return false;
	
	elseif is_function( _G['Chat_WindowExists'] )  then
		windowExists = Chat_WindowExists(newWindowName) or false;	
		
		if	windowExists  then
			return windowExists;
		end
	end

	local i_max = (#CHAT_FRAMES or count(CHAT_FRAMES) or NUM_CHAT_WINDOWS)

	for i,chatFrameName in pairs(CHAT_FRAMES) do
	
		chatWindowName	= GetChatWindowInfo(i);
		--chatFrameName	= Chat_GetFrameName(i);
		chatFrame		= rawget(_G, chatFrameName) or Chat_GetFrame(i);

		if	not windowFrameMatch and chatFrame and ( newWindowName == chatWindowName) then
			frameIndexMatch = i;
			windowFrameMatch = chatFrame or _G[chatFrameName] or _G['ChatFrame'..i];	
			chatWindowMatch = { ['chatFrame'] = chatFrame; ['chatFrameName'] = chatFrameName; ['chatWindowName'] = chatWindowName; };
		elseif windowFrameMatch and newWindowName == chatWindowName then
			_G['ChatFrame'..i] = nil;
			--CHAT_FRAMES[i] = nil;
			--[[
			for i=i+1,NUM_CHAT_WINDOWS or #CHAT_FRAMES do
			
				local __windowName = GetChatWindowInfo(i);
				if	type()

			end
			]]
		elseif chatWindowName == (nil or '' or ' ' or '  ') then
			_G['ChatFrame'..i] = nil;
			--CHAT_FRAMES[i] = nil;
		end

	end

	if not windowFrameMatch then 
		
		local chatTabFrame, chatTabIndex = FCF_OpenNewWindow(newWindowName);	--        There's no "PM" window, so we'll create one		

		_G[AddOnName]['ChatTabs'] = _G[AddOnName]['ChatTabs'] or {};
		_G[AddOnName]['ChatTabs'][newWindowName] = chatTabFrame or Chat_GetFrame(chatTabIndex);

		if chatTabFrame then
			return chatTabFrame, chatTabIndex, newWindowName;
		else			
			return false;
		end
		--local cframe=_G["ChatFrame"..i];
		--cframe.oldAlpha=cframe.oldAlpha or 0;
	else
		
		return chatWindowMatch['chatFrame'], chatWindowMatch['chatFrameName'], chatWindowMatch['chatWindowName']; 

	end

end
	
	--[=[
	if GetChatWindowInfo(1)~="Gen" then FCF_SetWindowName(ChatFrame1,"Gen",false); end--    If ChatFrame1 isn't named "Gen", rename it
	if GetChatWindowInfo(2)~="Log" then FCF_SetWindowName(ChatFrame2,"Log",false); end--    If ChatFrame2 isn't named "Log", rename it
	
	--  Scan for our "PM" window
	for i=3,NUM_CHAT_WINDOWS do
	--  Fix the ChatFrame.oldAlpha problem here
		local cframe=_G["ChatFrame"..i];
		cframe.oldAlpha=cframe.oldAlpha or 0;
	
		local t={GetChatWindowMessages(i)};
	--  Check if this window is named "PM" and only has the two whisper types registered (order of the function returns doesn't matter)
		if GetChatWindowInfo(i)=="PM" and #t==2 and ((t[1]=="WHISPER" and t[2]=="BN_WHISPER") or (t[1]=="BN_WHISPER" and t[2]=="WHISPER")) then
	--      If so, stop here
			return;
		end
	end

	local PMFrame=FCF_OpenNewWindow("PM");--        There's no "PM" window, so we'll create one
	ChatFrame_RemoveAllMessageGroups(PMFrame);--        Remove the default group registrations
	ChatFrame_AddMessageGroup(PMFrame,"WHISPER");--     Add normal whispers
	ChatFrame_AddMessageGroup(PMFrame,"BN_WHISPER");--  Add RealID whispers
	]=]
------------------------------------------------------
function DeleteDuplicateWindows()				--
------------------------------------------------------

	local printFunction = rawget((_G[AddOnName] or _G.ZerkinzConfig), 'ConsolePrint') or rawget(getmetatable(_G['ZerkinzConfig']), 'ConsolePrint') or _G['WindowPrint'] or rawget(_G, 'print');
	--[[
	local mt = { };
	function mt:__newindex(tbl,key,val) 
		local tbl_val = rawget(tbl, key) or nil;
		if tbl_val == nil  then 
			rawset(tbl,key,val); 
		end 
		mt.n = table.getn(tbl) or count(tbl);
		return val;
	end
	]]
	local chatWindows = {};
	local duped_chatWindows = {};
	local uniques = 0;
	local duplicates = 0;
	local windowName;
	local windowFrame;

	for i,frameName in pairs(CHAT_FRAMES) do

		windowFrame = _G[frameName];
		windowName = windowFrame.name or windowFrame:GetName();

		if is_string(windowName) then 
		
			if not chatWindows[windowName] then
				uniques = ( uniques or 0 ) + 1;
				chatWindows[windowName] = frameName;
			else
				duplicates = ( duplicates or 0 ) + 1;
				duped_chatWindows[windowName] = frameName;
				_G[frameName] = nil;
			end
		
		end

	end

	if is_number(uniques) and uniques > 0 then
		printFunction('RETURNED [', (uniques or 0), '] CHAT_FRAMES w/ UNIQUE NAME ::' )
		table.foreach(chatWindows, printFunction);			
	end

	if type(count(duped_chatWindows)) == 'number' and count(duped_chatWindows) > 0 then
		printFunction('DELETED [', (duplicates or 0), '] CHAT_FRAMES w/ SAME NAME ::' );
		table.foreach(duped_chatWindows, printFunction);
	end

	return true;

end
----------------------------------------------
function Chat_GetFrame(chatFrameIndex)		--
----------------------------------------------
	if	is_number(chatFrameIndex)  or  ( is_string(chatFrameIndex) and tonumber(chatFrameIndex) > 0 ) then
		local chatFrame = rawget(_G, CHAT_FRAMES[chatFrameIndex]) or _G["ChatFrame"..tostring(chatFrameIndex)] or nil;
		
		if	type(chatFrame) == ('table' or 'userdata') then
			return chatFrame;
		else
			return false;
		end
	else
		return false;
	end

end
----------------------------------------------
function Chat_GetFrameName(chatFrameInput)	--
----------------------------------------------
	if type(chatFrameInput) == 'number' then
		
		local frameName = GetChatWindowInfo(chatFrameInput) or ("ChatFrame"..tostring(chatFrameInput).."Tab"):GetText();
		--local frameName = stringMatch(chatFrameInput, CHAT_FRAMES, 'v') or "ChatFrame"..tostring(chatFrameInput);
		
		if	is_table(_G[frameName]) then
			return frameName, true;
		elseif is_string(frameName) then 
			return frameName, false;
		else
			return false;
		end

	elseif type(chatFrameInput) == 'string' then

		local windowName;
		local matchedFrameIndex; 
		local matchedWindowName; 
		local matchedFrameObject;
		local matchedFrameName;

		for frameIndex,frameName in pairs(CHAT_FRAMES) do
		
			windowName = GetChatWindowInfo(frameIndex);

			if	matchedWindowName and (chatFrameInput == frameName) then
			
				CHAT_FRAMES[frameIndex] = nil;

			elseif matchedWindowName == nil and (chatFrameInput == windowName)  then
				
				matchedFrameIndex = frameIndex;
				matchedWindowName = windowName;
				matchedFrameName = frameName;
				matchedFrameObject = CHAT_FRAMES[frameIndex];

			end

		end

		if matchedFrameName then
			return matchedFrameName or false, matchedFrameIndex or false, matchedWindowName or false;
		else
			return false, false, false;
		end		

	else
		return false, false, false;
	end
	--return ( type(chatFrameInput) == 'number' and "ChatFrame"..tostring(chatFrameInput) ) or false;
end


----------------------------------------------
function	Chat_GetWindowName(chatFrame)	--
----------------------------------------------	
	if	type(chatFrame) ~= ('number' or 'string') then
		return false;
	end

	local frameObject;
	local frameTitle;

	if	is_table(chatFrame)	then
		
		for	frameIndex, frameName in pairs(CHAT_FRAMES) do
			frameObject	= rawget(_G, 'ChatFrame'..frameIndex);

			if	( chatFrame == frameObject ) or ( tostring(chatFrame) == tostring(frameObject) )	then
				frameTitle = ChatWindowInfo(frameIndex);

				if	is_string(frameTitle)	then
					return frameTitle, frameIndex, frameObject;
				end

			end
		end

	elseif	is_string(chatFrame) and type( rawget(_G, chatFrame) ) ~= 'table'	then

		if	is_string(chatFrame) and is_table(_G[chatFrame])	then
			
			for frameIndex,frameName in pairs(CHAT_FRAMES) do
				
				local windowName = GetChatWindowInfo(frameIndex);
			
				if	frameName == chatFrame then 
					return windowName;
				end

			end

		else
			return false;
		end


	elseif is_number(chatFrame) then

		local chatWindowName	= GetChatWindowInfo(chatFrame);

		if type(chatWindowName) == 'string' then 
			return chatWindowName;
		else
			return false
		end
	

	else
		return false;
	end -- param checks

end


--[[ input : (string) windowName; ]]
--[[ returns : (table) chatFrame, (string) frameName(ChatFrame4), (string) chatWindowName(ZerkinzConsole);  ]]
----------------------------------------------
function Chat_WindowExists(windowInput)
----------------------------------------------
	local chatFrame;
	local chatFrameName;
	local chatWindowName;
	local chatWindow;

	local windowName = ( type(windowInput) ~= 'number' and type(windowInput) == 'string' and windowInput ) or nil;
	local windowFrameIndex = ( type(windowInput) == 'string' and type(windowInput) == 'number' and windowInput ) or nil;

	local windowInput = windowFrameIndex or windowName or nil;

	if not windowInput or ( type(windowName) ~= 'string' and type(windowFrameIndex) ~= 'number' ) then
		return false; 


	elseif	type(windowInput) == 'number' or is_number(windowFrameIndex) then
		
		chatWindow 			= Chat_GetWindowInfo(windowFrameIndex or windowInput);

		if 	type(chatWindow) == 'table' then

			chatWindowName		= chatWindow.name;  --	= GetChatWindowInfo(windowName);
			chatFrame			= chatWindow.object or Chat_GetFrame(chatWindow.index)			--[[  IE: _G['ChatFrame4'];  ]]
			chatFrameName 		= Chat_GetFrameName(chatWindow.index);	--[[ IE: ChatFrame4  ]]
			
			if type(chatFrame) == ( 'table' or 'userdata' ) then 
				return chatFrame, chatFrameName, chatWindowName;
			else
				return false;
				-- idk yet
			end		

		else

			return false;

		end

	elseif type(windowName) == 'string' or type(windowInput) == 'string' then

		for frameIndex,frameName in pairs(CHAT_FRAMES) do
		
			chatWindowName	= GetChatWindowInfo(frameIndex);

			if	windowName == chatWindowName or stringMatch(windowName, chatWindowName) then
				
				chatFrameName = frameName or Chat_GetFrameName(frameIndex);	--[[ IE: ChatFrame4  ]]
				chatFrame = Chat_GetFrame(frameIndex) or _G[chatFrameName] or nil;				--[[  IE: _G['ChatFrame4'];  ]]
				
				if type(chatFrame) == ('table' or 'userdata') then 
					return chatFrame, chatFrameName, chatWindowName;
				elseif _G[chatFrameName] then
					return chatFrame, chatFrameName, chatWindowName;
					-- idk yet
				end

			end

		end -- for

		return chatFrame or false;

	end -- parameter check

end -- END Chat_WindowExists(windowName)



--[[ input : (string) windowName; ]]
--[[ returns : (table) chatFrame, (string) frameName(ChatFrame4), (string) chatWindowName(ZerkinzConsole);  ]]
----------------------------------------------
function Chat_GetWindow(windowName)
----------------------------------------------
	if type(windowName) ~= 'string' then 
		return false;
	else

		local chatFrame, chatFrameName, chatWindowName =  Chat_WindowExists(windowName);

		if type(chatFrame) == 'table' then
			return chatFrame, chatFrameName or false, chatWindowName or false;
		else
			return chatFrame or false, chatFrameName or false, chatWindowName or false;
		end

	end

end


----------------------------------------------
function Chat_GetWindowFrame(windowName)
----------------------------------------------
		if type(windowName) ~= 'string' then 
			return false;
		else
	
			local chatFrame, chatFrameName, chatWindowName =  Chat_WindowExists(windowName);
	
			if type(chatFrame) == ( 'table' or 'userdata' ) then
				return chatFrame, chatFrameName or false, chatWindowName or false;
			else
				return false, chatFrameName or false, chatWindowName or false;
			end
	
		end
	
	end


--[[ input : (string) windowName; ]]
--[[ returns : (table) chatFrame, (string) frameName(ChatFrame4), (string) chatWindowName(ZerkinzConsole);  ]]
----------------------------------------------
function Chat_GetFrameByName(windowName)
----------------------------------------------
	if type(windowName) ~= 'string' then 
		return false;
	else

		local chatFrame, chatFrameName, chatWindowName =  Chat_WindowExists(windowName);

		if type(chatFrame) == 'table' then

			return chatFrame, chatFrameName or false, chatWindowName or false;
		
		else
			return false, false, false;
		end

	end

end


----------------------------------------------
function Chat_GetFrameLabel(chatFrameIndex)
----------------------------------------------
	if	is_number(chatFrameIndex) or is_number(tonumber(chatFrameIndex)) then

		local cframe_name = CHAT_FRAMES[tonumber(chatFrameIndex)] or nil;
		local cframe_object = cframe_name and _G[cframe_name];
		
		if	is_table(cframe_object) then
			return rawget(cframe_object, 'name') or false, cframe_name, cframe_object;
		else
			return false;
		end
		--return ( type(chatFrameIndex) == 'number' and _G["ChatFrame"..chatFrameIndex] ) or false;
	end
end


----------------------------------------------
function Chat_GetFrameNameTable(self, frameName, ...)
----------------------------------------------
	if	type(CHAT_FRAMES) == 'table' and frameName ~= nil and type(frameName) == 'string' then
	
		for	frameIndex,frameString in pairs(CHAT_FRAMES) do
			
			local frameObject = _G[frameString]; print(frameIndex, ' = ', frameString, frameObject, frameObject:GetName()); 
			
			if type(frameObject) == 'table' then

				for key,frameObjectTable in pairs(frameObject) do					
					if type(frameObjectTable) == 'table' then		

						local frameObjectName = frameObjectTable.name or nil; 
						if frameObjectName == frameName then 
							return frameObjectTable, frameObjectName;
						end

					else 
						--return false;
					end
				end

			else 
				return false;
			end
		end 
	else	
		return false;
	end

	return false;

end


----------------------------------------------
function Chat_GetWindowInfo(chatWindowName, ...)
----------------------------------------------

	local chatWindow; 
	local windowInfo;

	local chatWindows = {};
	local chatFrameIndex = ( type(chatWindowName) == 'number' and chatWindowName ) or nil;
	local chatWindowName = ( type(chatWindowName) ~= 'number' and type(chatWindowName) == 'string' and chatWindowName ) or nil;

	if	type(chatFrameIndex) ~= 'number' and type(chatWindowName) ~= 'string' then --type(chatWindowName) ~= ('string' or 'number') then 
		return false;
	
	elseif	type(chatFrameIndex) == 'number' then
		chatWindow = {};
		chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.docked, chatWindow.uninteractable	= GetChatWindowInfo(chatWindowName);
		chatWindow.index 		= ( chatFrameIndex and tonumber(chatFrameIndex) );
		chatWindow.frameName	= Chat_GetFrameName(chatFrameIndex or chatWindow.index); --(type(v) == 'string' and tostring(v));-- or ( chatWindow.index and 'ChatFrame'..tostring(chatWindow.index)..'' ) or nil;
		chatWindow.object 		= Chat_GetFrame(chatWindow.index); --_G[chatWindow.frameString] or nil;
		
		if	( type(chatWindow) == 'table' ) then 
			return chatWindow; --windowInfo = chatWindow or table.copy(chatWindow); 
		else
			return false;
		end

	elseif	type(chatWindowName) == 'string' then

		_G[AddOnName]['ChatWindows'] = type(_G[AddOnName]['ChatWindows']) == is_table(_G[AddOnName]['ChatWindows']) or {};
		
		for frameIndex,frameName in pairs(CHAT_FRAMES) do

			chatWindow = {};
			chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.index, chatWindow.uninteractable	= GetChatWindowInfo(frameIndex);
			chatWindow.index = tonumber(frameIndex); -- or ( type(chatWindow.index) == 'number' and chatWindow.index );-- or frameIndex;

			if type(chatWindow) == 'table' and type(chatWindow.name) == 'string' then

				chatWindow.frameName	= (frameName and tostring(frameName));-- or ( chatWindow.index and 'ChatFrame'..tostring(chatWindow.index)..'' ) or nil;
				chatWindow.object 		= Chat_GetFrame(chatWindow.index); --_G[chatWindow.frameString] or nil;

				_G[AddOnName]['ChatWindows'][chatWindow.name] = {}; --is_table(_G[AddOnName]['ChatWindows'][chatWindow.name]) or chatWindows[chatWindow.name][key] = val;

				-- copy new instance of current window's info before deletinng next loop
				_G[AddOnName]['ChatWindows'][chatWindow.name] = chatWindow;
				
				--[[
				is_table(_G[AddOnName]['ChatWindows'][chatWindow.name]) or {}; 

				for key,val in pairs(chatWindow) do	
					_G[AddOnName]['ChatWindows'][chatWindow.name][key] = val;
				end
				]]

				if	( ( chatWindow.name == chatWindowName ) and type( chatWindow.object ) == ( 'table' or 'userdata' ) ) then	
					return chatWindow;
				end
					--[[	if	windowNameMatched == 'true' then
						windowInfo = windowInfo or {};  
						windowInfo[key] = val;
					end	
			--]]	
				--[[for key,val in pairs(chatWindow) do
						windowInfo[key] = val;
					end
					windowInfo = chatWindows[chatWindow.name];
				]]--
				

			end -- END if window.name

		end -- END for

		--rawset(_G[AddOnName], 'ChatWindows', chatWindows);
		--_G[AddOnName]['ChatWindows'] = is_table(chatWindows) or nil; --table.copy(chatWindows);

		if type(windowInfo) == 'table' then --or windowInfo ~= (nil or false) then
			return windowInfo or false;
		else

			local windowObject = stringMatch(chatWindowName, chatWindows, 'v') or (type(chatWindows[chatWindowName]) == 'table' and chatWindows[chatWindowName]) or nil;

			if	( type(windowObject) == ('table' or 'userdata') )  or  ( type(chatWindows[chatWindowName]) == ('table' or 'userdata') ) then -- and chatWindows[windowMatch] ~= nil then
				return (windowObject or chatWindows[windowMatch]);
			else
				return false;
			end

		end

	else -- END if type() == string
		return false;
	end 

end



----------------------------------------------
function	Chat_GetFramesInfo(...)
----------------------------------------------		
	local self = ( ( type(self) == 'table' and self ) or _G[AddOnName] );
	
	ZerkinzConfig['ChatWindowsIndex'] = ZerkinzConfig['ChatWindowsIndex'] or {};
	ZerkinzConfig['ChatWindows'] = ZerkinzConfig['ChatWindows'] or {};

	--ApplyChatTypeSettings();

	--ACTIVE_CHAT_WINDOWS = CountChatWindows() or 0;

	local _i = 0;
	local i = 1;

	--for i = 1, (ACTIVE_CHAT_WINDOWS--[[ or NUM_CHAT_WINDOWS ]]) do
	
	for k,v in pairs(CHAT_FRAMES) do

		--[[if	i == _i then
			i = i + 1;
		end]]

		i = tonumber(k); 

		chatWindow = {};
		chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.docked, chatWindow.uninteractable	= GetChatWindowInfo(k);
		chatWindow.index = i;
	
		if	not chatWindow.name  then
			break;
		else--if not ZerkinzConfig['ChatWindows'][chatWindow.name] then

			chatWindow.frameName = (chatWindow.index and (Chat_GetFrameName(chatWindow.inndex) or 'ChatFrame'..tostring(chatWindow.index)) );
			--chatWindow.object = _G[chatWindow.frameString];

			if	chatWindow.object then
				ZerkinzConfig.ChatWindowsIndex[(chatWindow.index or i)] = chatWindow;
				--ChatWindows[(chatWindow.index or i)] = chatWindow;
				ZerkinzConfig['ChatWindows'][chatWindow.name] = Chat_GetFrame(chatWindow.index or i); --chatWindow.object;
			end

		end

		--_i = i;

	end

	--ZerkinzConfig.ChatWindowsIndex
	--ZerkinzConfig.ChatWindowsInfo = ChatWindows;

	return true;

end


function GetChatWindowByName(chatWindowName)
	
	if	type(chatWindowName) == 'string' then
		local chatWindow;

		for frameIndex,frameName in pairs(CHAT_FRAMES) do
			chatWindow = {};
			chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.docked, chatWindow.uninteractable	= GetChatWindowInfo(k);
			chatWindow.index = frameIndex;
			chatWindow.frameName = Chat_GetFrameName(chatWindow.index) or ("ChatFrame"..tostring(chatWindow.index));
			--debug: ZerkinzConfig:Print("ZerkinzConsole", "Scanning: ", chatWindow.name, "; searching for: ", chatWindowName);

			if	chatWindow.name == chatWindowName or stringMatch(chatWindow.name, chatWindowName) then
				chatWindow.object = ((chatWindow.index and Chat_GetFrame(chatWindow.index)) or Chat_GetFrame(frameIndex)) or nil;
				--debug: ZerkinzConfig:Print('GetChatWindowByName(', chatWindowName, ') FOUND: ', chatWindow.name);
				return chatWindow.object, chatWindow.index, chatWindow;
			end

		end

		return chatWindow.object or false, chatWindow.name or false, chatWindow or false;	

	else	
		return false;
	end

end



function GetChatFrameName(index)
	if	type(index) == 'number' then
		local chatFrame = Chat_GetFrame(index);
		local chatWindow = {};
		chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.index, chatWindow.uninteractable	= GetChatWindowInfo(index);
		return chatWindow.name or false, chatFrame or false, chatWindow or false;
	else	
		return false;
	end
end	

function GetChatFrame(index)
	if	type(index) == 'number' then
		local chatFrame = Chat_GetFrame(index);
		local chatWindow = {};
		chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.index, chatWindow.uninteractable	= GetChatWindowInfo(index);
		return chatFrame or false, chatWindow.name or false, chatWindow or false;
	else	
		return false;
	end
end


function GetChatWindow(index)

	if	type(index) == 'number' then
		local chatFrame = Chat_GetFrame(index);
		local chatWindow = {};
		chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.index, chatWindow.uninteractable	= GetChatWindowInfo(index);
		return chatFrame, chatWindow.name, chatWindow;
	else	
		return false;
	end

	--chatWindow.index = chatWindow.docked or i;

	if	not chatWindow.name  then
		return false;
	else
		
		chatWindow.frameString	= (chatWindow.index and tostring('ChatFrame'..tostring(chatWindow.index)));
		chatWindow.object = _G[chatWindow.frameString];
	
		if	not ZerkinzConfig['Windows'][chatWindow.name] then
		
			ZerkinzConfig['Windows'][chatWindow.name] = _G[chatWindow.object];
			return chatWindow;
		
		else
			return chatWindow;
		end
	end
end

function GetChatWindows()

	local MT;

	ZerkinzConfig['Windows'] = ZerkinzConfig['Windows'] or {};
	ZerkinzConfig['ChatWindows'] = ZerkinzConfig['ChatWindows'] or {};

	local ChatWindows = {};
	local i;
	
	for k,v in pairs(CHAT_FRAMES) do

		i = k;
		
		chatWindow = {};
		chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.index, chatWindow.uninteractable	= GetChatWindowInfo(i);
		--chatWindow.__name = chatWindow.name;
		--chatWindow.index = chatWindow.docked or i;
	
		if	not chatWindow.name  then
			break;
		elseif chatWindow.name then --not ZerkinzConfig['Windows'][chatWindow.name] then

			MT = {
				__name = chatWindow.name,
				__tostring = function(MT) return ((type(MT) == 'table' and MT.__name) or chatWindow.name or chatWindow.__name); end,
			};					

			--ChatWindows[chatWindow.index] = setmetatable(chatWindow, MT);
			ZerkinzConfig['ChatWindows'][chatWindow.index] = chatWindow;
			chatWindow.frameString	= (chatWindow.index and tostring('ChatFrame'..tostring(chatWindow.index)));
			chatWindow.object = _G[chatWindow.frameString];

			if	chatWindow.object then
				ZerkinzConfig['Windows'][chatWindow.name] = chatWindow.object;
			end

		end

	end

	return true;

end

--[=[
function SetChatType(typeName, typeGroup, typeSettings)

	if type(_G.ChatTypeInfo) == 'table' and type(ChatTypeGroup) == 'table' then 

		ChatTypeInfo = (type(_G['ChatTypeInfo']) == 'table' and _G['ChatTypeInfo']) or nil;
		ChatTypeGroup = (type(_G['ChatTypeGroup']) == 'table' and _G['ChatTypeGroup']) or nil;

	else

		return false;

	end

	local	consoleName 	= 'ZerkinzConsole';
	local	consoleVarsName = 'ZerkinzCVars';

	local	chatTypeName 		= (typeName and string.upper(tostring(typeName))) or nil;
	local   chatTypeGroup 		= (typeGroup and string.upper(tostring(typeGroup))) or nil;
	local   chatTypeSettings 	= (type(typeSettings) == 'table' and typeSettings) or nil;
	
	local	chatTypeSettings 								= {};
			chatTypeSettings[string.upper(consoleName)]		= { sticky = 1, flashTab = true, flashTabOnGeneral = true, ignoreChatTypeProcessing = false };
			chatTypeSettings[string.upper(consoleVarsName)]	= { sticky = 1, flashTab = true, flashTabOnGeneral = false, ignoreChatTypeProcessing = false };
			chatTypeSettings['DEFAULT']						= { sticky = 0, flashTab = false, flashTabOnGeneral = false, ignoreChatTypeProcessing = true };

	local	chatTypeGroup 									= {};
			chatTypeGroup[string.upper(consoleName)] 		= 'SYSTEM';
			chatTypeGroup[string.upper(consoleVarsName)]	= 'SYSTEM';
			chatTypeGroup['DEFAULT'] 		= nil;

	if 	chatTypeName and chatTypeGroup and chatTypeSettings then

		_G.ChatTypeInfo[chatTypeName] = chatTypeSettings[chatTypeName] or _G.ChatTypeInfo[chatTypeName]
		_G.ChatTypeGroup[((chatTypeName and tostring(chatTypeName)) or chatTypeGroup)] = { "CHAT_MSG_"..tostring(chatTypeGroup), };

		return true;

	else
		return false;
	end 

	if	type(ChatTypeInfo) ~= 'table' then return false; end

end		
	--[[
	if	( type(frameName) ~= 'string' or type(_G['ChatTypeInfo']) ~= 'table' ) then
		return false;
	elseif ( frameName and type(frameName) == 'string' and type(ChatTypeInfo[frameName]) == 'table' ) then
		return false, ChatTypeInfo[frameName];
	else 
		if	frameName and frameName == consoleName then
		_G.ChatTypeInfo[frameName] = chatTypeSettings[string.upper(consoleName)];
	end

	--local typeSettings = (frameName == 'ZerkinzConsole')]]
	--local chatTypeSettings = (type(typeSettings) == 'table' and typeSettings) or { sticky = 0, flashTab = false, flashTabOnGeneral = false, ignoreChatTypeProcessing = false };



function ApplyChatTypeSettings(chatType, settings)

	if	type(ChatTypeInfo) == 'table' and type(settings) == 'table' then 
		ChatTypeInfo[chatType] = settings;
		return true;
	else

		local ZerkinzChatSettings = {

			MESSAGE_SCROLLBUTTON_INITIAL_DELAY = 0;
			MESSAGE_SCROLLBUTTON_SCROLL_DELAY = 0.01;
			CHAT_BUTTON_FLASH_TIME = 3;
			CHAT_TELL_ALERT_TIME = 300;
			NUM_CHAT_WINDOWS = 20;--CountChatWindows();
			DEFAULT_CHAT_FRAME = ChatFrame1;
			CHAT_FOCUS_OVERRIDE = nil;
			NUM_REMEMBERED_TELLS = 25;
			MAX_WOW_CHAT_CHANNELS = 30;
			MAX_COUNTDOWN_SECONDS = 3600; -- One Hour	

		};

		for	k,v in pairs(ZerkinzChatSettings) do 
			_G[tostring(k)] = v;
		end

		return true;

	end
end
	--[[else

		local i = 0;

		for k,v in pairs(settings) do
			local upper_k = string.upper(k);

			if	ZerkinzChatSettings[upper_k] then 
				i = i + 1;
				_G[upper_k] = v;
			end
		end
		
		if i > 0 then
			return true;
		else 
			return false;
		end

	end]]

	]=]

function CountChatWindows()

	local chatWindows = ( type(CHAT_FRAMES) == 'table' and CHAT_FRAMES ) or nil; 
	local chatWindowsCounter;
	local CHAT_FRAMES = _G.CHAT_FRAMES;

	if	type(CHAT_FRAMES) == 'table' then
		
		for k,v in pairs(chatWindows) do
			chatWindowsCounter = (chatWindowsCounter or 0) + 1;
		end

		if 	type(chatWindowsCounter) == 'number' then 
			_G.ACTIVE_CHAT_WINDOWS = chatWindowsCounter;
			return chatWindowsCounter or false;
		else
			chatWindowsCounter = 0;
			_G.ACTIVE_CHAT_WINDOWS = chatWindowsCounter;
			return chatWindowsCounter or false;
		end

	else
		return false;
	end
end



function ChatWindowExists(chatWindowRequest)

	local chatFrameString = nil;
	local chatFrameObject = nil;
	local chatWindowName = nil;
	local chatWindowCount = (type(chatWindowCount) == 'number' and chatWindowCount) or #CHAT_FRAMES;
	local chatWindow = nil;
	local chatWindowIndex = nil;
	local chatWindowExists = false;
	local chatWindowResult = nil;
	local chatWindowRequest = chatWindowRequest and tostring(chatWindowRequest);
	local chatWindowCount = (type(CHAT_FRAMES) == 'table' and (#(CHAT_FRAMES) or table.count(CHAT_FRAMES)));
	local chatWindowLimit = NUM_CHAT_WINDOWS;

	ZerkinzConfig['ChatWindows'] = ( ( type(ZerkinzConfig['ChatWindows']) == 'table' and ( ZerkinzConfig['ChatWindows'] or {} ) ) or {} );
	ZerkinzConfig['ChatWindowsIndex'] = ( ( type(ZerkinzConfig['ChatWindowsIndex']) == 'table' and ( ZerkinzConfig['ChatWindowsIndex'] or {} )) or {} );

	if type(ZerkinzConfig['ChatWindowsIndex']) ~= 'table' then ZerkinzConfig['ChatWindowsIndex'] = {}; end

	if	type(chatWindowRequest) == 'number'  and  GetChatWindowInfo(chatWindowRequest)  then
		chatWindowName = GetChatWindowInfo(chatWindowRequest);
	elseif	type(chatWindowRequest) == 'string'  then
		chatWindowName = chatWindowRequest;	
	else
		return false;
	end

	local max_i = chatWindowLimit or chatWindowCount or 15;
	local _i = 0;
	local i;
	local window;
	
	if	type(CHAT_FRAMES) == 'table' then

		for k,v in pairs(CHAT_FRAMES) do
			
			i = tonumber(k);

			chatWindow = {};
			chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.docked, chatWindow.uninteractable	= GetChatWindowInfo(k);
			chatWindow.index = i;
			chatWindow.frameName = Chat_GetFrameName(chatWindow.index)
			chatWindow.object = ((chatWindow.index and Chat_GetFrame(chatWindow.index)) or Chat_GetFrame(i)) or nil;

			if chatWindow.index and chatWindow.name and chatWindow.object then

				ZerkinzConfig.ChatFrames = ZerkinzConfig.ChatFrames or {};
				ZerkinzConfig.ChatFrames[chatWindow.name] = chatWindow;
				ZerkinzConfig['ChatWindows'][chatWindow.name] = chatWindow.object;
				ZerkinzConfig['ChatWindowsIndex'][chatWindow.index] = chatWindow;

				if	( chatWindow.name and chatWindow.name == chatWindowName) then
					
					return chatWindow.object or false, chatWindow.index or false, chatWindow or false;

				end

			end

		end -- for

		return false;
	else
		return false;
	end -- if CHAT_FRAMES

end	-- function

	--[=[
	for i = 1, (chatWindowCount) do

		if	i == _i then 
			i = i + 1;
		end

		chatWindow = {};
		chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.index, chatWindow.uninteractable	= GetChatWindowInfo(i);
		--chatWindow.index = chatWindow.index or i;
	
		if	not (chatWindow.name or chatWindow.index)	then
			
			break;
			--[[
			if type(chatWindowResult) == 'table' then
				return chatWindowResult;
			else
				return chatWindowResult or false;
			end
			]]
		elseif chatWindow.name and chatWindow.index then

			chatWindow.frameString	= (chatWindow.index and tostring('ChatFrame'..tostring(chatWindow.index)));
			chatWindow.object = _G[chatWindow.frameString];

			if 	chatWindow.object and ( ( not _G.ZerkinzConfig['ChatWindows'][chatWindow.name] )  --[[or  ( _G.ZerkinzConfig.Windows[chatWindow.name] ~= chatWindow.object )]] ) then
			
				_G.ZerkinzConfig['ChatWindows'][chatWindow.name] = chatWindow.object;
				_G.ZerkinzConfig['ChatWindowsIndex'][chatWindow.index] = chatWindow;
				--[[function()
					local frameString = chatWindow.framestring;
					return _G[frameString] or chatWindow.object; 
				end]] --chatWindow.object;

				--_G.ZerkinzConfig['ChatWindows'][chatWindow.name]:AddMessage();
				ZerkinzConfig:Print(chatWindow.name, 'ZerkinzConfig : Initialized Chat Window ('..tostring(chatWindow.name)..');'); 

				if	not chatWindowResult and (tostring(chatWindow.name)	==	tostring(chatWindowName) ) and chatWindow.object	then
				
					chatWindowExists = true;
					chatWindowResult = chatWindow;
					chatWindowName	= chatWindow.name;
					chatWindowIndex	= chatWindow.index;
					chatFrameString	= chatWindow.frameString; --tostring('ChatFrame'..chatFrameIndex);
					chatFrameObject	= chatWindow.object;
					found = i;
					
					--return chatWindowResult or chatWindow or false;

				end


			end

			
		else

			--return false;
			
		end	-- if chatWindow.name or not
		
		_i = i;

	end	-- for loop
	
	--return chatWindowResult or false;

	if	( chatWindowExists == true and chatWindowExists ~= (false or nil) ) or ( type(chatWindowResult) == 'table' and chatWindowResult.name ) then
		return (chatWindowExists or false), chatWindowResult, chatWindowResult.index, chatWindowResult.name, chatWindowResult.object, chatWindowResult.frameString;
	else
		return false;
	end
	
end	
	]=]
	


function ChatWindowByIndex(index)

	--local chatFrameName, chatFramePrefix, chatFrameSuffix, chatFrameString;
	if	not ZerkinzConfig.ChatWindowsIndex then 
		Chat_GetFramesInfo(_G[AddOnName]);
	end

	local chatFrame = {};

	if index and type(index) == 'number' then
		
		ZerkinzConfig.ChatWindowsIndex = (type(ZerkinzConfig.ChatWindowsIndex) == 'table' and ZerkinzConfig.ChatWindowsIndex) or nil;

		--local prefix = 'ChatFrame'..tostring(index);
		--local suffix = tostring(index);

		chatFrame.name = GetChatWindowInfo(index);
		chatFrame.index = index;
		chatFrame.string = tostring('ChatFrame'..tostring(index));
		chatFrame.object = ( type(ZerkinzConfig.ChatWindowsIndex[index]) == 'table' and ZerkinzConfig.ChatWindowsIndex[index].object ) or _G[chatFrame.string]; 

		if chatFrame.object then
			return chatFrame.object, chatFrame.name, chatFrame.index, chatFrame.string, chatFrame;
		else
			return false;
		end

	else 

		return false;

	end

end




function StringColor(rbg, s)
	local rgb = (type(rbg) == 'string' and rgb) or "FFFFFF";
	local s = ( (s ~= (nil or '')) and tostring(s) );
	local msg = '\124cFF'..tostring(rgb)..tostring(s)..'\124r';
	if msg then return msg; end
	local format = '\124cFF%s%s\124r';
	local formatted = string.format(format, rgb, s) or s; 
	return formatted, s;
end

function ColorText(hexCode, ...)

	local argCount = select("#", ...) or 0;
	local s;

	if type(argCount) == 'number' and tonumber(argCount) > 1 then 
		s = table.concat({...});
	elseif argCount == 1 then
		s = tostring(... or '');
	else
		s = 'no text given';
	end

	local s = (s and type(s) == ('string' or 'number') and tostring(s)) or false;
	local coloredText = s;
	
	if	s and hexCode 	then

		local format = "|cff%s%s|r";
		local colored_string = string.format(format, hexCode, s);
		--local colored_string = StringColor(hexCode, s);
		--local hexCoded_string = "|cff"..hexCode.."|124r";
		--local ss = "COLORED STRING => "..hexCoded_string;
		--ChatFrame1:AddMessage(ss);

		if colored_string then return colored_string; end

		if	hex and type(hex) == ('string' or 'number') then
			coloredText = WrapTextInColorCode(s, hexCode) or false;
				return coloredText or s;
		else
			return s;
		end

	else

		return false;

	end
end



function string.equivalent(needle, haystack, caseSensitive, matchTableValue)

	if	( type(haystack) ~= 'string' or 'table' or 'function' ) or ( type(needle) ~= 'string' ) then
		return false, needle;
	
	elseif	type(needle) == 'string' then
		
		if	( type(haystack) == 'string' ) then
			
			if	( string.lower(needle) == string.lower(haystack) ) then
				return haystack;
			else
				return false;
			end

		elseif	type(haystack) == 'table' then

			local returning_value; 

			for k,v in pairs(haystack) do	--	++<FOR-LOOP>

				returning_value = ( ( ( not matchTableValue ) or ( matchTableValue == nil or false or '' or ' ' or '  ' ) ) and k ) or ( ( matchTableValue == true or 'true' ) and v );
				
				if	matchTableValue == nil or false or '' or ' ' then
					returning_value	= k;
				else
					returning_value = v;	
				end

				if ( ( type(caseSensitive) == 'boolean' and caseSensitive == true ) or ( type(caseSensitive) == 'string' and caseSensitive == 'true' ) ) and ( tostring(needle) == tostring(returning_value) )	then
					
					return returning_value;

				elseif	string.lower(needle)  ==  string.lower(tostring(returning_value))	then

						return returning_value;

				end
			end								--	--<FOR-LOOP/>
		end
	end
end	--	function string.equivalent()




	function rawinsert(...)
	
		local _G = _G;
		local _ENV = _G;
	
		local args_input = {...};
		local args = {};
		local args_i = {};
		local args_count = count(args_input) --or #args_input or select("#", args_input); 

		if	type(args_count) ~= "number" then

				print('------------------------\ncount failed.. args_count was not a number\n------------------------')
				return false;

		end
	
		if args_count < 2 then return false; end

		local _t, _k, _v;

		local argVals = {
				[3] = {	
						[1] = 't',
						[2] = 'k',
						[3] = 'v'
				},
				[2] = {
						[1] = 't',
						[2] = 'v'
				}
		};

		local valTable = argVals[args_count];

		for k,v in ipairs(args_input) do
				args_i[k] = v;	--args[k] = v;
		end

		for k,v in pairs(args_i) do
				local	newKey = valTable[k];
				args[newKey] = v;
				_ENV[newKey]	= v;
				_G[newKey]  	= v;
				print(newKey, v);
		end

		--print('rawinsert count = ', args_count)

		--print(args_count, valTable, valTable[1]);
	--[[
		for k,v in pairs(args) do
				
				local newKey = k;--valTable[k];
				print(newKey, v);
				args[newKey]	= v;
				_ENV[newKey]	= v;
				_G[newKey]  	= v;

		
		end]]
		
	
	for k,v in pairs(args_input) do 
		print('| '..tostring(k)..' |>----[ rawinsert ]: args = ', k, ' = ', v); 
	end
	


		if args_count <= 1 then

			return false;

		elseif	args_count == 3 then
				_t = ( type(rawget(args, 't')) == "table" and rawget(args, 't') ) or false;
				_k = ( type(rawget(args, 'k')) == "table" and rawget(args, 'k') ) or rawget(args, 'k') or _t[args_input[2]] or false;
				_v = rawget(args_input, 'v') or false;

				if type(_k) == "table" then
						_t = _k;
						_k = tonumber(count(_t) or 0) + 1
						_v = _v;
				elseif	type(_t[_k]) == "table" then
						_t = _t[_k]
						_k = ( ( tonumber(select("#", _t)) or tonumber(count(_t)) ) or 0 ) + 1;
						_v = _v;
				else
						_t = _t;
						_k = _k;
						_v = _v;
				end

		elseif args_count == 2 then

				_t	=	rawget(args, 't') or false;
				_k 	=	( type(_t) == "table" and ( tonumber(select("#", _t)) or tonumber(count(_t)) or 0 ) + 1);
		--( type(rawget(args, 't') == "table" and ( tonumber(count(_t)) or tonumber(select("#", args['t'] )) or 0) + 1 )) or false;
				_v = rawget(args, 'v');
	
				--_k	= (	type(_t[args_input[2]]) == "table" and _t[args_input[2]] ) or _t[args_input[2]] or false;		

		end
			
		local return_val;
		local rawset_val;
		
		--print('| ? |>----[ rawseting values ]:(', _t, _k, _v, ');');
		--print(_t, _k, _v); --_G['t'], _G['k'], _G['v']);	t, k ,v, '||',
	
		if	_t and _k and _v then

				rawset_val = rawset(_t, _k, _v);
				return_val = rawget(_t, _k);
				print('|'..tostring('+++')..'|>----[ rawSET ] :: ["'..tostring(_t)..'"]["'..tostring(_k)..'"] = ', return_val);
				print('|---------------------------------------------------------------|');
		
				if	return_val then
						return return_val, rawset_val, _t, _k, _v;
				else
						return false, rawset_val, _t, _k, _v;
				end
			
		else
			return false, _t, _k, _v;
		end
end


table.rawinsert = rawinsert;

		--[[
		local argVals = {};
		argVals[3] = { "t", "k", "v" };
		argVals[2] = { "t", "v" };
	
		for k,v in pairs(args_input) do
				local newKey = argVals[k];
				args[newKey]	= v;
				_ENV[newKey]	= v;
				_G[newKey]  	= v;
		end

	
	if	type(t) == 'table' then
			rawset(t, select("#", t)+1, v);
			return rawget(t, k);
	else
		return false;
	end
	]]


	--print(stopwatch('start'), os.clock())

	function rawsetfield (f, v)
		
		local path = nil;
		local t = ( type(_G) == 'table' and _G ) or {}; 	--s = f;

		for	w, d in string.gmatch(f, "([%w_]+)(.?)") do
				
			if	type(t) ~= 'table' then
				t = _G or {};
			end
			
			--print(w, d);
		
			if	d == "." then

				if	not path then 
					path = w;	--.. d; 
				else 
					path = path..d..w; 
				end

				rawset(t, w, rawget(t, w) or {})
				t = rawget(t, w);  --t[w] = t[w] or {};  -- create table if absent;  --t = t[w];  -- get the table

			else                  -- last field

				path = path.."."..w;
				rawset(t, w, v);
				--t[w] = v            -- do the assignment
				print("__index['write'](  '"..tostring(v)..",  '"..tostring(path).."'  )"); --  : v, rawsetfield path : [ ', v, ' ]:\n', path);
	
				return v, path;

			end
		end
	end




	--[[
	We rely on gfind, from the string library, to iterate over all words in f (where "word" is a sequence of one or more alphanumeric characters and underscores).
	The corresponding function to set fields is a little more complex. An assignment like

	a.b.c.d.e = v
	is exactly equivalent to
	local temp = a.b.c.d
	temp.e = v
	That is, we must retrieve up to the last name; we must handle the last field separately. The new setfield function also creates intermediate tables in a path when they do not exist:
	]]	

	--[[
	function getfield (f)

		local G = _G    -- start with the table of globals
		
		for w in string.gmatch(f, "[%w_]+") do
			G = G[w]
		end

		return G;

	end


	function setfield (f, v)
		t = ( type(_G) == 'table' and _G ) or {}
		--s = f;
		for w, d in string.gmatch(f, "([%w_]+)(.?)") do
			if	d == "." then
				t[w] = t[w] or {}   -- create table if absent
				t = t[w]            -- get the table

			else                  -- last field

				t[w] = v            -- do the assignment
				return v;

			end
		end
	end
	]]	

	--[[
		local G = _G    -- start with the table of globals
		print(type(G), G);

		for w, d in string.gmatch(f, "([%w_]+)(.?)") do

			if	d == "." then      -- not last field?

				G[w] = G[w] or {}   -- create table if absent
				G = G[w]            -- get the table

			else                  -- last field

				G[w] = v            -- do the assignment
				return v;
			end

		end

	end
	]]



	function getkey(f)

		local t = _G    -- start with the table of globals
		
		for w in string.gmatch(f, "[%w_]+") do
			if type(t[w]) == 'table' then
				t = t[w]
			else
				--ZerkinzConfig:Print('General', '|cffFF0000ERROR: There was an ERROR calling getfield('..tostring(w)..';|r');
				--ZerkinzConfig:Print('ZerkinzConsole', '|cffFF0000ERROR: There was an ERROR calling getfield('..tostring(w)..';|r');
				return nil;
			end
			--print(type(t), t, w);
		end
		--print('returning ', t)
		return t;

	end



	function	getPathString (f)

		local v = _G    -- start with the table of globals
		
		for w in string.gmatch(f, "[%w_]+") do
			if type(v) == 'table' and type(v[w]) ~= 'nil' then 
				v = v[w]
			else
				return nil;
			end
		end

		return v

	end		



	function getval (f)

		local v = _G    -- start with the table of globals
		
		for w in string.gmatch(f, "[%w_]+") do
			if type(v) == 'table' and type(v[w]) ~= 'nil' then 
				v = v[w]
			else
				return nil;
			end
		end

		return v

	end	



	function setval (f, v)
		local t = _G    -- start with the table of globals
		
		for w, d in string.gmatch(f, "([%w_]+)(.?)") do
			
			if	d == "." then      -- not last field?
				t[w] = t[w] or {}   -- create table if absent
				t = t[w]            -- get the table

			else                  -- last field
				t[w] = v            -- do the assignment
				return t[w]
				
			end
		end
	end



	function getfield (f)

		local t = _G    -- start with the table of globals
		
		for w in string.gmatch(f, "[%w_]+") do
			if type(t[w]) == 'table' then
				t = t[w]
			else
				ZerkinzConfig:Print('General', '|cffFF0000ERROR: There was an ERROR calling getfield('..tostring(w)..';|r');
				ZerkinzConfig:Print('ZerkinzConsole', '|cffFF0000ERROR: There was an ERROR calling getfield('..tostring(w)..';|r');
				return false;
			end
			--print(type(t), t, w);
		end
		--print('returning ', t)
		return t;

	end



	function setfield (f, v)
		local path = nil;
		local t = ( type(_G) == 'table' and _G ) or {};
		--s = f;
		for w, d in string.gmatch(f, "([%w_]+)(.?)") do
				
			if	type(t) ~= 'table' then
				t = _G or {};
			end
			--print(w, d);
		
			if	d == "." then

				if not path then 
					path = w .. d; 
				else 
					path = path .. w .. d; 
				end
				
				t[w] = t[w] or {}   -- create table if absent
				t = t[w]            -- get the table

			else                  -- last field

				path = path .. w;
				t[w] = v            -- do the assignment
				--print(path);
				return v, path;

			end
		end
	end	



	function rawgetval (f)

		if 	type(f) ~= "string" then 
			return false;
		else

			local v = _G    -- start with the table of globals
			
			for w in string.gmatch(f, "([%w_]+)(.?)") do 	--[[	"[%w_]+") do ]] 
				if type(v) == 'table' and type(v[w]) ~= 'nil' then 
					v = rawget(v, w);
				else
					return nil;
				end
			end

			return v
		
		end

	end		



	function rawsetval (s, v)
		
		local path = nil;
		local t = ( type(_G) == 'table' and _G ) or {}; 	--s = f;

		for	w, d in string.gmatch(s, "([%w_]+)(.?)") do
				
			if	type(t) ~= 'table' then
				t = _G or {};
			end
			
			--print(w, d);
		
			if	d == "." then

				if	not path then 
					path = w;	--.. d; 
				else 
					path = path..d..w; 
				end

				rawset(t, w, rawget(t, w) or {})
				t = rawget(t, w);  --t[w] = t[w] or {};  -- create table if absent;  --t = t[w];  -- get the table

			else                  -- last field

				local	result = rawset(t, w, v);
				local	return_result = rawget(t, w);

				path = path.."."..w;

				--t[w] = v            -- do the assignment
				print("__index['write'](  '"..tostring(path).."', [[ = ]] '"..tostring(return_result).."'  )"); --  : v, rawsetfield path : [ ', v, ' ]:\n', path);
	
				return return_result, path;

			end
		end
	end



	function path_getval (f)

		if 	type(f) ~= "string" then 
			return false;
		else

			local v = _G    -- start with the table of globals
			
			for w in string.gmatch(f, "([%w_]+)(.?)") do 	--[[	"[%w_]+") do ]] 
				if type(v) == 'table' and type(v[w]) ~= 'nil' then 
					v = rawget(v, w), f;
				else
					return nil;
				end
			end

			return v
		
		end

	end			



	function path_setval (s, v)
		
		local path = nil;
		local t = ( type(_G) == 'table' and _G ) or {}; 	--s = f;

		for	w, d in string.gmatch(s, "([%w_]+)(.?)") do
				
			if	type(t) ~= 'table' then
				t = _G or {};
			end
			
			--print(w, d);
		
			if	d == "." then

				if	not path then 
					path = w;	--.. d; 
				else 
					path = path..d..w; 
				end

				rawset(t, w, rawget(t, w) or {})
				t = rawget(t, w);  --t[w] = t[w] or {};  -- create table if absent;  --t = t[w];  -- get the table

			else                  -- last field

				local	result = rawset(t, w, v);
				local	return_result = rawget(t, w);

				path = path.."."..w;

				--t[w] = v            -- do the assignment
				print("__index['write'](  '"..tostring(path).."', [[ = ]] '"..tostring(return_result).."'  )"); --  : v, rawsetfield path : [ ', v, ' ]:\n', path);
	
				return return_result, path;

			end
		end
	end




function keyExists(needle, haystack, return_val, caseSensitive, needleType)
	if 	type(needle) == 'string' and type(haystack) == 'table' then
		for	k,v in pairs(haystack) do
			if	( ( not caseSensitive or caseSensitive == ('' or ' ' or nil) ) and string.lower(needle) == string.lower(k) ) or ( caseSensitive and needle == k ) then
				if not needleType or type(needleType) == 'nil' or needleType == nil then
					return k, (v or haystack[k]);
				elseif	type(needleType) == 'string' and type(v) == string.lower(needleType) then
					return k, haystack[k];
				end
			end
		end
		return false;
	else
		return false;
	end
end



function valueExists(needle, haystack, caseSensitive)
	if 	type(needle) == 'string' and type(haystack) == 'table' then
		for	k,v in pairs(haystack) do
			if	( not caseSensitive or caseSensitive == '' or ' ' or nil ) and ( string.lower(needle) == string.lower(v) ) then
				return v,k;
			elseif	( type(caseSensitive) == 'boolean' and caseSensitive == true or 'true' ) and ( needle == v ) then
				return v,k;
			end
		end
		return false;
	elseif	needle and type(haystack) == 'table' then
		for k,v in pairs(haystack) do
			if	( type(needle) == type(v) )  and  ( needle == v )	then
				return v,k;
			end
		end
	elseif	type(needle) == type(haystack) and needle == haystack then			
		return haystack;
	else	
		return false;
	end
end



function GetKeyName(needle, haystack, caseSensitive)

	local key;
	local val;

	if	not needle or type(haystack) ~= 'table'	then

		return false;

	elseif 	type(needle) == 'string' and type(haystack) == ( 'table' or 'userdata' ) then

		for	k,v in pairs(haystack) do
			if	( not caseSensitive or caseSensitive == ( '' or ' ' or nil ) ) and ( string.lower(needle) == string.lower(v) ) then
				key, val = k, v;
				break;
				--return k, v;
			elseif	( type(caseSensitive) == 'boolean' and caseSensitive == true or 'true' ) and ( needle == v ) then
				key, val = k, v;
				break;
				--return k, v;
			end
		end

		return (key or false), (val or nil);

	elseif	needle and type(haystack) == ( 'table' or 'userdata' ) then

		local key;
		local val;

		for k,v in pairs(haystack) do
			if	( type(needle) == type(v) )  and  ( needle == v )	then
				key = k;
				val = v;
				break;
				--return k, v;
			end
		end

		return (key or false), (val or nil);

	elseif	type(needle) == type(haystack) and needle == haystack then
		
		key, val = GetKeyName(needle, haystack);
		return (key or false), (val or nil);

	else	
		
		return false;

	end

end



function pairExists(needle, haystack, match_key_val, caseSensitive)
	
	local match_type
	
	local function match_element(input, key, val)
		local match_types = {};
		match_types['k'] = k or key;
		match_types['key'] = k or key;
		match_types['v'] = v or val;
		match_types['val'] = v or val;
		match_types['value'] = v or val;
		local input = (input and tostring(input));
		local return_val = match_types[input] or false;
		return return_val;
	end

	if 	type(needle) == 'string' and type(haystack) == 'table' then
		
		for	k,v in pairs(haystack) do
			
			local needle_source = match_element(match_key_val, k, v);

			if	( not caseSensitive or caseSensitive == '' or ' ' or nil ) and ( string.lower(needle) == string.lower(needle_source) ) then
				return k,v;
			elseif	( type(caseSensitive) == 'boolean' and caseSensitive == true or 'true' ) and ( needle == needle_source ) then
				return k,v;
			end
		end

		return false;

	elseif	needle and type(haystack) == 'table' then
		for k,v in pairs(haystack) do
			local needle_source = match_element(match_key_val, k, v);
			if	( type(needle) == type(needle_source) )  and  ( needle == needle_source )	then
				return k,v;
			end
		end
		
	elseif	type(needle) == type(haystack) and needle == haystack then			
		return haystack;
	else	
		return false;
	end
end		



table.functions = {};
table.functions['__index'] = function(table, key, val)

	if	not getmetatable(table) then
		setmetatable( table,	_G[AddOnName]['MetaTable'] );
	end

	local raw_value = rawget(table, key);

--[[	INSTANTIATE NESTED MTABLE VALUES	]]--		--print('__index :: ', self, table, '[', key, '] = ', val);
	val				= ( type( raw_value ) == 'table' and raw_value ) or {};
	val['Print']	= rawset(table[key], 'Print', rawget(_G[AddOnName], 'Print'));
	val['self'] 	= rawget(table, 'self') or table;
	val['parent']	= raw_value;

	rawset(table, key, val);
	raw_value = rawget(table, key);
	setmetatable(raw_value, getmetatable(table));

	return val;

end

--table.Functions = Functions;

--[[
function table.metatable(table, metatable)

	local _ENV = {};
	local table, metatable;
	
	table 		= ( type(table) 	== 'table' and table )		or 	{};
	metatable 	= ( type(metatable) == 'table' and metatable )	or 	{};
	

--[>	INSTANTIATE INITIAL MTABLE VALUES	<]--	--table['metatable'] = {}	--local metatable = table['metatable'];	--metatable['self'] = metatable;
	metatable['__index'] = ( type(metatable['__index']) == 'function' and metatable['__index'] ) or function(functable, key, val)

		if	not getmetatable(functable) then
			setmetatable(functable, metatable);
		end	

--[>	INSTANTIATE NESTED MTABLE VALUES	<]--		--print('__index :: ', self, table, '[', key, '] = ', val);
		val				= ( type( rawget(functable, key) ) == 'table' and rawget(functable, key) ) or {};
		val['self']		= table;
		val['parent']	= rawget(functable, key);
	--	val['self'] 	= rawget(functable, 'self') or functable;
		rawset(table, key, val);
		setmetatable(table[key], metatable);

		return val;

	end

	setmetatable(table, metatable);
	return table, metatable		


end
]]

function construct_tables(tableName)

	local	tableNames		= {}
			tableNames['ZerkinzConfig']	= 'ZerkinzConfig';

	if	type(tableName) == 'string' and tableNames[tableName] then
		
		--local	tables = {}; --rawget(_G, tableName) or rawset(_G, tableName, {}); 
		
		_G[tableName] 								= _G[tableName] or {};
		_G[tableName]["AddOn"]						= _G[tableName]["AddOn"] or {};
		_G[tableName]["Initialize"]					= _G[tableName]["Initialize"] or {};
		_G[tableName]["LoadedModules"]				= _G[tableName]["LoadedModules"] or {};
		_G[tableName]["Profiles"] 					= _G[tableName]["Profiles"] or {};
		_G[tableName]["Actions"]					= _G[tableName]["Actions"] or {};
		_G[tableName]["Events"] 					= _G[tableName]["Events"] or {};
		_G[tableName]["EventFunctions"]				= _G[tableName]["EventFunctions"] or {};
		_G[tableName]["Functions"] 					= _G[tableName]["Functions"] or {};
		_G[tableName]["LaunchPad"]					= _G[tableName]["LaunchPad"] or {};
		_G[tableName]["Methods"]					= _G[tableName]["Methods"] or {};
		_G[tableName]['ChatWindows']				= _G[tableName]['ChatWindows'] or {};

		

		--_G[AddOnName]["EventFunctions"]		= {};
		--_G[AddOnName]["Events"]["States"]		= {};

		return _G[tableName];
		
	end

end

function __construct(t)

	local self = self or _G[AddOnName];

	if type(t) ~= 'table' or type(self) ~= 'table' then return false; end

	local set_status;
	local set_failures = 0;
	local failed_keys = {};

	for k,v in pairs(t) do
		set_status = (pcall(rawset(self, k, v)) and rawset(self,k,v));
		if not set_status then set_failures = tonumber(set_failures) + 1; failed_keys[k] = v; end
	end

	return self or false, set_failures, failed_keys;

end



function NumberArgs( ... )

	local args = ( type(arg) == 'table' and arg ) or { ... };
	local numbered_args;
	local count = ( type(args) == 'table' and tonumber(#(args)) ) or nil;
	local i;

	if	type(arg) == 'table' or type(args) == 'table' then
		
		numbered_args = {};
		
		for k,v in ipairs(args) do
			i = (i or 0) + 1;
			numbered_args[k] = v;
			--count = ( count and tonnumber((tonumber(count) + 1)) ) or tonumber(k);
		end

		return numbered_args, (count or i);

	end

end



function NameArgs( args, ... )

	local names = { ... };

	if type(args) ~= 'table' then
		return false;

	elseif type(names) ~= 'table'	then
		return args;

	else -- criteria is met

		local named_args = {};

		for k,v in ipairs(args) do

			local arg_name = ( type(names[k]) == 'string' and tostring(names[k]) ) or tostring(k);
			if	type(arg_name) == 'string' then
				named_args[arg_name] = v;
			end
		end

		return named_args or args;

	end
end




function table.metatable(t, mt)

	local t		= ( type(t) == 'table' and t ) or {};
	local mt	= ( type(mt) == 'table' and mt ) or {};
	
	function mt:__construct(t)

		local self = self or _G[AddOnName];

		if type(t) ~= 'table' or type(self) ~= 'table' then return false; end
	
		local set_status;
		local set_failures = 0;
		local failed_keys = {};
	
		for k,v in pairs(t) do
			set_status = (pcall(rawset(self, k, v)) and rawset(self,k,v));
			if not set_status then set_failures = tonumber(set_failures) + 1; failed_keys[k] = v; end
		end
	
		return self or false, set_failures, failed_keys;	

	end

	--[=[

	function t:Print (chatWindowName, ...)

		local self = self;
		local name = self and (self:GetName() or tostring(self));
		local window;
		local loop_window;
		local message;
		local chatWindowName = chatWindowName and tostring(chatWindowName);
		local chatWindowObject = GetChatWindowByName(chatWindowName); --ZerkinzConfig.ChatWindows[chatWindowName];
		
		if	( type(Chat_GetFramesInfo) ~= 'function'  )  or  ( type(ZerkinzConfig.ChatWindows) ~= 'table' ) or ( chatWindowName and not chatWindowObject ) then
			Chat_GetFramesInfo(_G[AddOnName]);
			chatWindowObject = GetChatWindowByName(chatWindowName) or ZerkinzConfig.ChatWindows[chatWindowName] or ZerkinzConfig.ChatWindows['General'];
		end

		local args = (... and tostring(...)) or 'no args supplied';
		local addon_name = ColorText("FF0000", 'ZERKiNZ')..ColorText("FFFFFF", "CONFiG")..ColorText("FFFFFF", ":")..ColorText("FF0000", chatWindowName);
		local message = "[ t:Print ]( ["..select("#", args or {arg}).."]"..tostring(select(1, {arg}))..ColorText("FFFFFF", (args and tostring(args)) or '').." );";
		--local final_message = tostring(addon_name)..tostring(message);
		
		if	chatWindowObject then
			--chatWindowObject:AddMessage(message);
			chatWindowObject:AddMessage(tostring(addon_name).."\n"..tostring(message));
			--window = ZerkinzConfig.ChatWindows.General or ZerkinzConfig.ChatWindows.ZerkinzConsole or _G.ChatFrame1; 
		end
		
		--[[
		for k,v in pairs(ZerkinzConfig.ChatWindows) do
			loop_window = (type(v) == ('table' or 'userdata') and v) or nil;
			if loop_window then
				loop_window:AddMessage(message);
			else
				print(message);
			end

		end
			print(ColorText(name, "FF0000"), ...);
		]]
	end

	function t:ConsolePrint(...)
		
		local self = self;
		local name = self and (self:GetName() or tostring(self));
		local window;
		local loop_window;
		local message;
		local addon_name;
		local chatWindowName = 'ZerkinzConsole'; --chatWindowName and tostring(chatWindowName);
		local chatWindowObject = GetChatWindowByName(chatWindowName); --ZerkinzConfig.ChatWindows[chatWindowName];
		
		if	( type(rawget(ZerkinzConfig.Initialize, 'ChatFrames')) ~= 'function') or ( type(ZerkinzConfig.ChatWindows) ~= 'table' ) or ( chatWindowName and not chatWindowObject ) then

			Chat_GetFramesInfo(_G[AddOnName]);
			chatWindowObject = GetChatWindowByName(chatWindowName) or ZerkinzConfig.ChatWindows[chatWindowName] or ZerkinzConfig.ChatWindows['General'];

		end

		local args = (... and tostring(...)) or 'no args supplied';
		addon_name = "["..ColorText("FF0000", "\124cFFcc0000ZERKiNZ\124")..ColorText("FFFFFF", "CONFiG").."]";
		message = "t:ConsolePrint"..ColorText("FFFFFF", ":").."( ["..ColorText("FFFFFF", args).."], "..tostring(args).." );";
		--message = "t:ConsolePrint( ["..ColorText("FF0000", tostring( select("#", args) )).."], ".." | "..(args and ColorText("FFFFFF", tostring(args))).." );";
		--local final_message = tostring(addon_name)..tostring(message);
		
		if type(message) == 'string' then
			SendSystemMessage(tostring(addon_name).."\n"..tostring(message));
		end

		if	chatWindowObject then
			chatWindowObject:AddMessage(tostring(addon_name).."\n"..tostring(message));
			--window = ZerkinzConfig.ChatWindows.General or ZerkinzConfig.ChatWindows.ZerkinzConsole or _G.ChatFrame1; 
		end
		
	end

	]=]

	--[[		
	local function Print(...)

		print("[|cffFF0000", tostring(self), "|r]:|cffFF0000Print|r(", select(1, ...), ")");
		local args = extract(...);

	end
	]]--

	--mt 							= {};
	--mt['Print'] = 				--Print; --( type( _G[ScriptName]['Print'] ) == 'function' ) and _G[ScriptName]['Print']; --or ( type(t['Print']) == 'function' and t['Print'] ) or function (...)
	--[[
	mt['Print']	=  function (...)

		print("[|cffFF0000", tostring(self), "|r]:|cffFF0000Print|r(", select(1, ...), ")");
		local args = extract(...);

	end ]]
	--mt['__table'] = t;
	--mt['__tablename'] = t:GetName();
	--mt['table_object']	= t;
	--mt['metatable_object']	= mt;
	--[[
	mt["Print"]	= function(table, ...)	local args = tostring(...); print("|cff000000[|cffFF0000ZERKiNZ|r|cffFFFFFFCONFiG|r]|cffFFFFFF:|r[|cffFF0000Print|r]|r( |cffFF0000", select("#", ...), select(2, ...), '; args = ', args, "|r );"); return true;	end
	function mt:Print(self, ...)

		local name = self:GetName() or tostring(self);
		local args = tostring(...);
		print("|cff000000[|cffFF0000ZERKiNZ|r|cffFFFFFFCONFiG|r]|cffFFFFFF:|r[|cffFF0000Print|r]|r( |cffFF0000", select("#", ...), select(2, ...), '; args = ', args, "|r );");
		return true;
	end
	]]

	--[[
	function t:Print (chatWindowName, ...)

		local self = self;
		local name = self and (self:GetName() or tostring(self));
		local window;
		local loop_window;
		local message;
		local chatWindowName = chatWindowName and tostring(chatWindowName);
		local chatWindowObject = GetChatWindowByName(chatWindowName); --ZerkinzConfig.ChatWindows[chatWindowName];
		
		if	( type(Chat_GetFramesInfo) ~= 'function'  )  or  ( type(ZerkinzConfig.ChatWindows) ~= 'table' ) or ( chatWindowName and not chatWindowObject ) then
			Chat_GetFramesInfo(_G[AddOnName]);
			chatWindowObject = GetChatWindowByName(chatWindowName) or ZerkinzConfig.ChatWindows[chatWindowName] or ZerkinzConfig.ChatWindows['General'];
		end

		local args = select("#", ...) > 0 and tostring(...);
		local addon_name = ColorText("FF0000", "ZERKiNZ")..ColorText("FFFFFF", "CONFiG")..ColorText("FFFFFF", ":")..ColorText("FF0000", chatWindowName).." : "..ColorText("FFFF00", "t:Print()");
		local message = select("#", ...) > 0 and ...;
		local format = "|> %s\n|>--[ %s ]";
		local output = string.format(format, addon_name, message);
		--local message = "[ t:Print ]( ["..select("#", args or {arg}).."]"..tostring(select(1, {arg}))..ColorText("FFFFFF", (args and tostring(args)) or '').." );";
		--local final_message = tostring(addon_name)..tostring(message);
		
		if	chatWindowObject then
			chatWindowObject:AddMessage(tostring(output));	--window = ZerkinzConfig.ChatWindows.General or ZerkinzConfig.ChatWindows.ZerkinzConsole or _G.ChatFrame1; 
		elseif DEFAULT_CHAT_WINDOW then	
			DEFAULT_CHAT_WINDOW:AddMessage(tostring(DEFAULT_CHAT_FRAME:GetName())..' : '..tostring(output));
		end

	end	

	]]

	function t:Print (chatWindowName, ...)

		local self = self;
		local name = self and (self:GetName() or tostring(self));
		
		local window;
		local loop_window;
		local message;
		
		--local defaultChatFrameName		= DEFAULT_CHAT_FRAME:GetName();
		--local defaultChatFrameTab			= defaultChatFrameName..'Tab';
		--local defaultChatFrameTabName 	= defaultChatFrameTab:GetText();

		local chatWindowName 			= ( chatWindowName and tostring(chatWindowName) ) or ( _G[DEFAULT_CHAT_FRAME:GetName()..'Tab']:GetText() ) or 'ZerkinzConsole';
		local chatWindowObject 			= Chat_GetWindow(chatWindowName) or DEFAULT_CHAT_WINDOW; --ZerkinzConfig.ChatWindows[chatWindowName];
		
		if	( chatWindowName and not chatWindowObject ) then

			Chat_GetFramesInfo(_G[AddOnName]);
			chatWindowObject = Chat_GetWindow(chatWindowName) or DEFAULT_CHAT_WINDOW; -- or ZerkinzConfig.Windows[chatWindowName] or ZerkinzConfig.Windows['General'];

		end

		local AddonColor = '66FF11';

		local args_count = tonumber(select("#", ...)) or 0;
		local args = select(1, ...);
		local addon_name = ColorText(AddonColor, 'ZERKiNZ')..ColorText("FFFFFF", "CONFiG");
		local message = ( is_string(...) and tostring(...) ) or is_string(args) or ( args_count > 0 and table_tostring( { ... }, 235 ) );
		--local message = is_string(args) or ( args_count > 0 and table_tostring( { ... }, 235 ) );
		--( type(arg) == 'table' and table.concat(arg) ) or 

		if 	type(message) ~= 'string' or message == 'false' then 
			return false;
		end

		local format = "|>-[ %s ]:( %s );";
		local output = string.format(format, addon_name, message);

		if	chatWindowObject then
			chatWindowObject:AddMessage(tostring(output));	--window = ZerkinzConfig.ChatWindows.General or ZerkinzConfig.ChatWindows.ZerkinzConsole or _G.ChatFrame1; 
		elseif DEFAULT_CHAT_WINDOW then	
			DEFAULT_CHAT_WINDOW:AddMessage(tostring(DEFAULT_CHAT_FRAME:GetName())..' : '..tostring(output));
		end		

	end
	

	--mt["Print"] = function(self, chatWindowName, ...)
	function mt:Print(chatWindowName, ...)

		--[[
		if is_function(t.Print) then 
			t:Print(chatWindowName);
			return true;
		end
		]]

		local self = self;
		local name = self and (self:GetName() or tostring(self));
		local window;
		local loop_window;
		local message;
		local chatWindowName = chatWindowName and tostring(chatWindowName);
		local chatWindowObject = Chat_GetWindow(chatWindowName); --ZerkinzConfig.ChatWindows[chatWindowName];
		
		if	( chatWindowName and not chatWindowObject ) then

			Chat_GetFramesInfo(_G[AddOnName]);
			chatWindowObject = Chat_GetWindow(chatWindowName) or ZerkinzConfig.Windows[chatWindowName] or ZerkinzConfig.Windows['General'];

		end

		local AddonColor = 'FF0000';

		print(chatWindowName, tonumber(#{...}), table.getn({...}), #arg, arg.n, table.tostring({...}) )
		
		local args_t = is_table({...}) or is_table(arg); --( ( tonumber(#{...}) or table.getn(arg or {...}) ) > 0 and { ... } ) or nil;
		local args_t_tostring = {};
		local args_tostring = '';

		if	is_table(args_t) then
			
			for k,v in pairs(args_t) do
				rawset(args_t_tostring, k, tostring(v));
				local row_string =  '[ '..tostring(k)..' ] == '..tostring(v)..' ('..type(v)..')';
				print(chatWindowName, row_string)
				args_tostring = args_tostring..row_string;
			end

			print(chatWindowName, 'table.concat = ', table.concat(args_t_tostring));
			print(chatWindowName, table.tostring(is_table(args_t) or arg))
		end

		local args_count = tonumber(select("#", ...)) or 0;
		local args = select(1, ...);
		local addon_name = ColorText(AddonColor, 'ZERKiNZ')..ColorText("FFFFFF", "CONFiG")..'.MT:Print : ';
		local message = table.tostring( args_t );

		if 	type(message) ~= 'string' or message == 'false' then 
			return false;
		end

		local format = "|>-[ %s ]:( %s );";
		local output = string.format(format, addon_name, message);

		--[[
		local args = (... and tostring(...));
		local args_count = select("#", ...) or #(arg) or '0';
		local addon_name = ColorText(AddonColor, 'ZERKiNZ')..ColorText("FFFFFF", "config")..ColorText("FFFFFF", ":")..ColorText(AddonColor, chatWindowName);
		local message = args;
		local format = "|> %s[%s]: %s";
		local output = string.format(format, addon_name, args_count, message);
		--local message = "[ t:Print ]( ["..select("#", args or {arg}).."]"..tostring(select(1, {arg}))..ColorText("FFFFFF", (args and tostring(args)) or '').." );";
		--local final_message = tostring(addon_name)..tostring(message);
		]]

		if	chatWindowObject then
			chatWindowObject:AddMessage(tostring(output));	--window = ZerkinzConfig.ChatWindows.General or ZerkinzConfig.ChatWindows.ZerkinzConsole or _G.ChatFrame1; 
		elseif DEFAULT_CHAT_WINDOW then	
			DEFAULT_CHAT_WINDOW:AddMessage(tostring(DEFAULT_CHAT_FRAME:GetName())..' : '..tostring(output));
		end
		
		--[[
		for k,v in pairs(ZerkinzConfig.ChatWindows) do
			loop_window = (type(v) == ('table' or 'userdata') and v) or nil;
			if loop_window then
				loop_window:AddMessage(message);
			else
				print(message);
			end

		end
			print(ColorText(name, "FF0000"), ...);
		]]
	end	



	function t:ConsolePrint(...)
		
		local self = self;
		local name = self and (self:GetName() or tostring(self));

		if 	not is_table(arg) or ( is_number( select("#", ...) ) and tonumber( select("#", ...) ) < 1 ) then
			return false;
		end

		local chatWindowName = 'ZerkinzConsole'; --chatWindowName and tostring(chatWindowName);
		local chatWindowObject = Chat_GetWindow(chatWindowName); --ZerkinzConfig.ChatWindows[chatWindowName];		
		
		local argN = ( is_table(arg) and ( is_number(rawget(arg, 'n')) or is_number(count(arg)) or is_number(#(arg)) ) ); --table.getn(arg);
		local argsCount = select("#", ...);
		local args_count = argsCount or 0;
			
		local args = tonumber(argN) or tonumber(args_count) > 0 and select(1, ...);
		local argConc = type(arg) == 'table' and table.concat(arg);
		local argsTest = tostring(select(1, ...));
		
		local addon_name = ""..ColorText("1166FF", "ZERKiNZ")..ColorText("66FF11", "CONFiG").."";
		local message = tostring(""..ColorText("FFFFFF", ":")..ColorText("66FF11", "mt:ConsolePrint")..ColorText("FFFFFF", ":").."["..ColorText("FFFFFF", "ConsolePrint").."]|r( ["..ColorText("FF0000", tostring(select("#", ...))).."]"..ColorText("66FF11", is_string(args) or is_string(argConc) or is_string(argsTest) ).."; );");
		local format = "|> %s:\n|>-[ %s ]";
		local formatted_message = string.format(format, addon_name, message);

		if	tonumber(args_count) < 1 or is_number(argN) and argN < 1 then
			chatWindowObject:AddMessage(formatted_message);
			return false;
		end

		local window;
		local loop_window;
		local message;
		
		if	( type(ZerkinzConfig.ChatWindows) ~= 'table' ) or ( chatWindowName and not chatWindowObject ) then

			Chat_GetFramesInfo(_G[AddOnName]);
			chatWindowObject = Chat_GetWindow(chatWindowName) or ZerkinzConfig.ChatWindows[chatWindowName] or ZerkinzConfig.ChatWindows['General'];

		end

		local addon_name = ""..ColorText("1166FF", "ZERKiNZ")..ColorText("66FF11", "CONFiG").."";
		local message = tostring(""..ColorText("FFFFFF", ":")..ColorText("66FF11", "mt:ConsolePrint")..ColorText("FFFFFF", ":").."["..ColorText("FFFFFF", "ConsolePrint").."]|r( ["..ColorText("FF0000", tostring(select("#", ...))).."]"..ColorText("66FF11", args).."; );");
		local format = "|> %s:\n|>-[ %s ]";
		local formatted_message = string.format(format, addon_name, message);
		--local final_message = tostring(addon_name)..tostring(message);
		
		if	chatWindowObject then
			chatWindowObject:AddMessage(formatted_message);
			return true;
			--window = ZerkinzConfig.ChatWindows.General or ZerkinzConfig.ChatWindows.ZerkinzConsole or _G.ChatFrame1; 
		else
			SendSystemMessage(formatted_message);
			return true;
		end
		
	end	

	

	function mt:ConsolePrint(...)
		
		local self = self;
		local name = self and (self:GetName() or tostring(self));

		local chatWindowName = 'ZerkinzConsole'; --chatWindowName and tostring(chatWindowName);
		local chatWindowObject = Chat_GetWindow(chatWindowName); --ZerkinzConfig.ChatWindows[chatWindowName];		
		
		local argN = is_table(arg) and table.getn(arg);
		local argsCount = select("#", ...);
		local args_count = argsCount or 0;
			
		local args = tonumber(argN) or tonumber(args_count) > 0 and select(1, ...);
		local argConc = type(arg) == 'table' and table.concat(arg);
		local argsTest = tostring(select(1, ...));
		
		local addon_name = ""..ColorText("1166FF", "ZERKiNZ")..ColorText("66FF11", "CONFiG").."";
		local message = tostring(""..ColorText("FFFFFF", ":")..ColorText("66FF11", "mt:ConsolePrint")..ColorText("FFFFFF", ":").."["..ColorText("FFFFFF", "ConsolePrint").."]|r( ["..ColorText("FF0000", tostring(select("#", ...))).."]"..ColorText("66FF11", is_string(args) or is_string(argConc) or is_string(argsTest) ).."; );");
		local format = "|> %s:\n|>-[ %s ]";
		local formatted_message = string.format(format, addon_name, message);

		if	tonumber(args_count) < 1 or is_number(argN) and argN < 1 then
			chatWindowObject:AddMessage(formatted_message);
			return false;
		end

		local window;
		local loop_window;
		local message;
		
		if	( type(ZerkinzConfig.ChatWindows) ~= 'table' ) or ( chatWindowName and not chatWindowObject ) then

			Chat_GetFramesInfo(_G[AddOnName]);
			chatWindowObject = Chat_GetWindow(chatWindowName) or ZerkinzConfig.ChatWindows[chatWindowName] or ZerkinzConfig.ChatWindows['General'];

		end

		local addon_name = ""..ColorText("1166FF", "ZERKiNZ")..ColorText("66FF11", "CONFiG").."";
		local message = tostring(""..ColorText("FFFFFF", ":")..ColorText("66FF11", "mt:ConsolePrint")..ColorText("FFFFFF", ":").."["..ColorText("FFFFFF", "ConsolePrint").."]|r( ["..ColorText("FF0000", tostring(select("#", ...))).."]"..ColorText("66FF11", args).."; );");
		local format = "|> %s:\n|>-[ %s ]";
		local formatted_message = string.format(format, addon_name, message);
		--local final_message = tostring(addon_name)..tostring(message);
		
		if	chatWindowObject then
			chatWindowObject:AddMessage(formatted_message);
			return true;
			--window = ZerkinzConfig.ChatWindows.General or ZerkinzConfig.ChatWindows.ZerkinzConsole or _G.ChatFrame1; 
		else
			SendSystemMessage(formatted_message);
			return true;
		end
		
	end
	--[[
	mt["__call"] = function(t,k,v,...) 

		local t_val 	= rawget(t,key);
		local mt_val	= rawget(mt, key);

		if	type(t_val) == "function" then
			print("__CALL | ", key, " = ", t_val, val)
			return t_val;
		elseif type(mt_val) == 'function' then
			print("__CALL | ", key, " = ", mt_val, val);
				--if not t_val then rawset(t,key,mt_val); end;	
			return mt_val;
		end

	end
	]]

	--[[
	mt['__tostring'] = function(table,key,val)

		local t_val = rawget(table,key) or nil;

		if	val then
			local v_val = (type(val) == ('table' or 'userdata') and val:GetName()) or val;
			return v_val;

		elseif 	type(table) == 'table' and t_val then
					
			if	t_val then
				return t_val:GetName();
			else
				return table:GetName() or rawget(table, '__name') or table;
			end
			--local __name = rawget(table, '__name');
			--return __name or table;
		end
	end

]]	

	function mt:ThisParent(self)
		return (self.__parent or self.parent or self.__upvalue or self);
	end

	function mt:ThisName(self)
		 return (self.name or self.__name or self.__tostring or tostring(self));
	end

	mt["__newindex"] = function(tbl,key,val)
		
		if is_table(val) then
			
			local tbl_mt = getmetatable(tbl);
			local val_mt = getmetatable(val);

			local new_mt = {};

			new_mt = table.copy(tbl_mt, new_mt);
			new_mt = table.copy(val_mt, new_mt);



		end

		--[[
		local __MT;
		local existing_MT;
		local val = val;
		local t_val = ( type(rawget(table, key)) == 'table' and rawget(table,key) ) or nil;

		if 	not t_val and type(val) == 'table' then

			__MT = getmetatable(val) or {};
			rawset(__MT, '__name', key);
			rawset(__MT, '__parent', rawget(table,key));
			rawset(__MT, '__path', rawget(mt, 'read_path'));
			rawset(__MT, '__metatable', mt);
			--val = setmetatable(val, __MT);

		end
		]]


		if	type(val) == ('table' or 'userdata') then
			
			local tbl_val 		= 	( rawget(tbl, key) or nil );
			local root_mt		= 	( type(getmetatable(t) == 'table' and getmetatable(t) ) ) or nil;
			local tbl_val_mt 	= 	( type(getmetatable(tbl_val)) == 'table' and getmetatable(tbl_val) ) or nil;
			local new_val_mt 	= 	( type(getmetatable(val)) == 'table' and getmetatable(val) ) or nil;
			

			local 	function __meta_tostring	(self)	local return_val = ( rawget(self, '__name') and rawget(self, '__name') ) or ( rawget(self, 'name') and rawget(self, 'name') ) or (self and self); return return_val; end	-- or self.name or self.moduleNName or self); end;
			--local function meta_tostring	(self)	local return_val = ( rawget(self, '__name') and tostring(rawget(self, '__name')) ) or ( rawget(self, 'name') and tostring(rawget(self, 'name')) ) or (self and tostring(self)); return return_val; end
			local	function __ThisName		(self) 	return (self.__name and self.__name) or (self.name and self.name) or (self and self); end
			local	function __ThisParent	(self) 	return (self.__parent and self.__parent) or (self.__updir and self.__updir) or (self and self); end
			local	function __ThisRoot		(self) 	return (self.__root and self.__root) or (self.__base and self.__base) or (self.__tableroot and self.__tableroot) or (self.__basetable and self.__basetable) or (self.__table); end
			local	function __call 		(self, ...) local args = select("#", ...) or 0; local dots = ( args > 0 and tostring(...)); print(rawget(self, '__name'), dots); return ( rawget(self, '__name')  or rawget(self, 'name') );  end
					function NameThis		(self)	return self.name or self.__name or self.__tostring or tostring(self); end
			--local __NameThis 	= 	function(self) return __tostring(self); end --return ((_G[AddOnName] and _G[AddOnName]['GetName'] ) or ( rawget(_G, _G.AddOnName) and rawget(_G.AddOnName, 'GetName' ) ) or ( root_mt and root_mt['GetName'] ) or ( root_mt and root_mt['__call'] )); end 

			--[[

			local	new_mt = {};
					new_mt = ( type(root_mt) 	== 'table'	and 	table.copy(root_mt, new_mt) ) or new_mt; 
					new_mt = ( type(tbl_val_mt) == 'table'	and 	table.copy(tbl_val_mt, new_mt) ) or new_mt; 
					new_mt = ( type(new_val_mt) == 'table'	and 	table.copy(new_val_mt, new_mt) ) or new_mt; 
			
			]]

			local 	new_mt = new_val_mt or tbl_val_mt or root_mt or {};
			
			--[[
			if	type(root_mt) == 'table' then
				for _k,_v in pairs(root_mt) do
					new_mt[_k] = _v;
				end
			end

			]]

			--[[

			if	type(tbl_val_mt) == 'table' then				
				for _k,_v in pairs(tbl_val_mt) do
					new_mt[_k] = _v;
				end				
			end

			]]

			--[[
			if	type(new_val_mt) == 'table' then				
				for _k,_v in pairs(new_val_mt) do
					new_mt[_k] = _v;
				end				
			end
			]]
					local new_mt = getmetatable(tbl) or {};-- getmetatable(val) or getmetatable(tbl) or getmetatable(t) or {};
					--new_mt = ( getmetatable(t)		and table.copy(getmetatable(t), new_mt) )		or new_mt;
					--new_mt = ( getmetatable(tbl) 	and table.copy(getmetatable(tbl), new_mt) ) 	or new_mt;
					new_mt = ( getmetatable(val) 	and table.copy(getmetatable(val), new_mt ) ) 	or new_mt;


					--new_mt = { 
						new_mt['moduleName'] 	= 	""..key;
						new_mt['name'] 			= 	""..key;												
						new_mt['__name']		= 	""..key;
						new_mt['__tostring']	= 	__meta_tostring
						--function(...) local __key = __tostring(key) or key; return __key; end; 	--function(...) local __key = key; return __key; end; 
						new_mt['Name']			= 	__ThisName
						new_mt['GetName']		= 	new_mt['GetName'] or __ThisName
						--new_mt['__call'] 		=	__call
						new_mt['__parent']		=	tbl;
						new_mt['Parent']		= 	__ThisParent
						new_mt['__root']		= 	t or _G[AddOnName] or ZerkinzConfig;
						new_mt['Root']			=	__ThisRoot
						new_mt['Print'] 		=	( type(rawget(mt, 'Print')) == 'function' and rawget(mt, 'Print') ) or ( type(rawget(t, 'Print')) == 'function' and rawget(t, 'Print') ) or ( type( getmetatable(t) and rawget(getmetatable(t), 'Print')) == 'function' and rawget(getmetatable(t), 'Print') );
						--new_mt['Print'] 		= 	( root_mt and type( root_mt['Print'] ) == 'function' and root_mt['Print'] ) or ( type(new_mt['Print']) == 'function' and new_mt['Print'] ) or ( type(_G[AddOnName]['Print']) == 'function' and _G[AddOnName]['Print'] ) or ( type(table['Print']) == 'function' and table['Print'] ) or ( type(_G[AddOnName]['Print']) == 'function' and _G[AddOnName]['Print'] )

							--['GetName'] 	= ( root_mt and type(root_mt['GetName']) == 'function' and root_mt['GetNName'] ) or ( type(new_mt['GetName']) == 'function' and new_mt['GetName'] ) or function() local __key = __tostring(key) or key; return __key; end,  
						--['GetName'] 		= __GetName,
	--					};
					--[[
					rawset(val, 'GetName', function(self)
						return self.__name or self.name or self.moduleName;
					end)
					]]
					--val['GetName']	=  __ThisName

			if not new_val_mt then		
				local val 		= setmetatable(val, new_mt);
			end

			local setval 	= rawset(tbl,key,val);

			return rawget(tbl,key) or val;


		else

			rawset(tbl,key,val);
			return rawget(tbl,key);
		
		end
		--[=[
		if val then return val end
		
		local read_keys = rawget(mt, "read_keys");
		local read_path = rawget(mt, "read_path");
		local path_str = "ZerkinzConfig";

		if	type(read_keys) == "table"	then
			
			for k,v in ipairs(read_keys) do
				
				path_str = tostring(path_str) .. "." .. tostring(v);
				print("__NEWindex | ", k, " = ", v);

			end				
			
		end

		--local myPrint = rawget(mt, "Print");
		--myPrint("|cffFF0000__newINDEX : ", key, "|r  |  [ |cffFF0000path_str|r ]|r = [ |cffFF0000", path_str, "|r ];  [ |cffFF0000read_path|r ] = [ |cffFF0000", read_path, "|r ];");
		ZerkinzConfig:Print("General", "|cff66FF11__newINDEX : ", key, " |r  |  [ |cff66FF11path_str|r ]|r = [ |cff66FF11", path_str, "|r ];  [ |cff66FF11read_path|r ] = [ |cff66FF11", read_path, "|r ];");
		--rawget(mt, mt:Print("General", "__newINDEX | path_str = [ |cffFF0000", path_str, "|r ];"));

		rawset(mt, "read_keys", nil);
		rawset(mt, "read_key", nil);
		rawset(mt, "read_path", nil);

		rawset(table,key,val);
		print("|cff66FF11__NEWindex | ", table, ", [ |cffFF0000", key, "|r ] = [ |cffFF0000", val, "|r ]; ", "rawget( ", rawget(table,key), " ); )");
		return val;
		]=]
	end
	
	mt["__index"] = function(tbl,key,val)		
		
		local mt_val = ( type(rawget(mt, key)) ~= ('nil' or nil) and rawget(mt, key) ) or nil;
		local t_val = rawget(tbl, key) or nil;
		local t_val_new = val or nil;
		--	local new_val = val;
		--local t_new = {};

		return t_val_new or t_val or mt_val or nil;

		--[=[

		if not t_val and mt_val then 

			--print('__index | no t_val, returninng mt_val = ', mt_val)
			return mt_val;
		
		else
			return t_val_new or t_val or nil;
		end

		local set_val = t_val_new or t_val or nil; -- or setmetatable({}, mt);

		--local myPrint = rawget(mt, mt.Print("|cffFF0000__index : ", key, "|r | [ |cffFF0000set_val|r ] = [ |cffFF0000", set_val, "|r ]; ", tostring(table), key, val, "; MT_val = ", mt_val));
		--myPrint("|cffFF0000__index : ", key, "|r | [ |cffFF0000set_val|r ] = [ |cffFF0000", set_val, "|r ]; ", tostring(table), key, val, "; MT_val = ", mt_val);
		ZerkinzConfig:Print("General", "|cff00CCFF__index : ", key, "|r | [ |cffFF0000set_val|r ] = [ |cffFF0000", set_val, "|r ]; ", tostring(table), key, val, "; MT_val = ", mt_val);
		--print(myPrint);

		if key ~= "Print" then 
			
			local read_keys 			= rawget(mt, "read_keys");
			local read_keys				= ( type(read_keys) == "table" and read_keys ) or {};
			rawset(mt, "read_keys", read_keys);
			
			local read_keys_position	= ( #(read_keys) or 1 ) - 1;
			--read_keys[read_keys_position] = key;

			--table.insert(read_keys, key);

			--rawset(mt, "read_keys", read_keys);
			rawset(mt, "read_time", GetTime());
			rawset(mt, "read_table", table);
			rawset(mt, "read_key", key);
			rawset(mt.read_keys, read_keys_position, key);
			rawset(mt, "read_path", rawget(mt, "read_path") or ("ZerkinzConfig." .. tostring(key)) );

		end
		
		if not t_val and mt_val then
			return	rawget(mt, key);
			
		elseif	set_val then
			rawset(table,key,set_val);
			return	set_val or rawget(table,key);

		end



		if not t_val and mt_val then
			return mt_val;
		end

		rawset(mt, 'read_time', GetTime());
		rawset(mt, "read_table", table);
		rawset(mt, "read_key", key);
		rawset(mt, "read_path", rawget(mt, "read_path") or ("ZerkinzConfig." .. tostring(key)) )

		if	val and val ~= nil 	then
			rawset(mt, "write_value", val);
		else
			rawset(mt, "write_value", nil);
		end

		local return_value;

		if val then

			return_val = val;

		elseif 	t_val	and		not val	then
			
			return_val = t_val;

		elseif mt_val then

			return_val = mt_val;
		--[[
		elseif	not t_val and type(mt_val) == "function" then
			return_value = mt_val;
			--return	mt_val;		--mt[key](table,key,val);
		
		elseif not t_val and mt_val then
			return_value = mt_val;
			--return mt_val;
		]]
		elseif type(new_val) == "table" and not getmetatable(new_val) then
			--new_val["dirObject"] = new_val; --rawget(table,key);
			return_val = new_val or {};
			return_val["keyName"] = key;
			return_val = setmetatable(return_val, mt);
			_return_val = rawget(rawset(table,key,return_val), key);
			return_val = return_val;
			--return new_val;
		end

		local self = _G[ZCFG];
		local ZerkinzPrint = rawget(mt, "Print");
		print('|cff00AAFF__index( ', table, ', ', key, ', ', val, ' ); rawsetval( ', return_val, ', ', _return_val, '); ZPrint(', type(ZerkinzPrint), ');');
		--ZerkinzPrint('__index( ', table, ', ', key, ', ', val, ' ); rawsetval( ', return_val, ', ', _return_val, ' );');
		--local printed_string = rawget(self, Print('__index( ', table, key, val, ' ); rawsetval( ', return_val, ', ', _return_val, ' );'));

		if 	return_val 	then 
			return return_val;
		else
			return rawget(table,key) or rawget(mt,key) or setmetatable({}, mt);
		end

		--print("__index :: ", self, tostring(table), key, new_val, type(new_val));
		return return_val;
	]=]

	end

	--t = 
	setmetatable(t, mt);

	return t, mt;

end 		-- end table.metatable		
		--[[
		local self = _G[AddOnName] or ZerkinzConfig or self;
		local metaself = mt;
		local AcePrintType = ( type(_G[AddOnName]['Print']) == 'function' ) and 'function' or false;
		
		local AcePrintObject
		if	AcePrintType == 'function' then
			AcePrintObject = self['Print'];
		end

		local argTable = { ... };
		local argString = '';
		
		if type(argTable) == 'table' then
		
			for k,v in pairs(argTable) do
				argString = argString .. ' [' .. tostring(k) .. '] = "' .. tostring(rawget(argTable,k)) .. '"; ';
			end
		
			local str	= 'argTable = ';
			local msg	= str .. tostring(argString);
				  msg	= '[|cff66FF11ZerkinzConfig|r]:[|cff66FF11Print|r](|cffFFFF33' .. tostring(msg) .. '|r)';

			local toPrint;

			if	type( rawget(_G[AddOnName], 'Print') ) == 'function' then
				toPrint = rawget( _G[AddOnName], _G[AddOnName]['Print'](msg) );
			else
				print(msg)
			end
			--print('Printing :: ' .. msg);
			--traverse(argTable, 1, 'argTable');
		
		end
		
		--print(type(...)); 
	
		return msg;
		
	end --_G[AddOnName]['Print'];
	]]
	
	--[>	__index function 	starts here ..	<]--
	--[[
	mt['__index'] 	= function(table, key, val)

		local	t_val = rawget(table,key);
		local	val = val or t_val;

		if	( type(val) == ( 'table' or 'function' or 'userdata' ) ) or ( string.lower(type(t_val)) == ('table' or 'function' or 'userdata') ) then

			if	type(val) == "table"	and		not getmetatable(val)	then --or ( t_val and getmetatable(t_val) );
				val = setmetatable(val, mt);
			end

			return ( val or t_val );
		
		else
			
			local new_val = val or {};
			local set_val = rawget(rawset(table, key, new_val), key);
			
			if	type(set_val) == 'table' then

				if 	not getmetatable(set_val) then
					set_val = setmetatable(set_val, mt);
				end					
				
			end

			return set_val;

		end
		
		local metaself	= mt;
		local self 		= table;
		local metaval = rawget(metaself, key);
		local selfval	= rawget(table, key);
		--rawset(table, key, val or {});
		local val =  rawget(table, key) or rawget(metaself, key) or val or {};
		--print(rawget(metaself, key), key);
		
		--print(rawget(table, nil), ' = table');
		--traverse(table);
		--print(' type = ', type( _G[AddOnName]['Print'] ) )
		
		if type( rawget(self, 'Print') ) == 'function' then
			--print('Print() = functionn .. ');
			rawget(self, self.Print('self:Print("General", ) __index :: ' .. tostring(table) .. ' = { [' .. key .. '] = ' .. tostring(val) .. ' };', '@@@@@@@@@@@@@@@@@@@@@', '>>>>>>>'))-- self, metaself );
		else
			print('__index :: ' .. tostring(table) .. ' = { [' .. key .. '] = ' .. tostring(val) .. ' };', '!!!!!!!!!!!!!!!!!!!!!!', '#$$$$$$$$$')-- self, metaself );
		end
								--rawset(table, key, val)
								--rawset(table, key, setmetatable( rawget(table, key), metaself ) );
		
		if	selfval or metaval and type(val) == 'table' then
				self.Print('__INDEX EXISTS :: ', key, '\n');
				rawset(table, key, selfval or metaval);
				return selfval or metaval;		
		elseif	not selfval and not metaval and type(val) == 'table' then
				setmetatable( val, metaself )
				rawset(table, key, val);
				return val;
		else
				--return metaval;
		end
	
	end -- end __index
	]]--
	

--[[
mt['__newindex'] = function(table,key,val)
		local rself = self;
		local self = table;
		
		rawget(self, self.Print('__newindex :: ' .. tostring(rself) .. tostring(table) .. ' = { [' .. key .. '] = ' .. tostring(val) .. ' };', '@@@@@@@@@@@@@@@@@@@@@', '>>>>>>>'))
		print('__newindex :: ' .. tostring(rself) .. tostring(table) .. ' = { [' .. key .. '] = ' .. tostring(val) .. ' };', '@@@@@@@@@@@@@@@@@@@@@', '>>>>>>>')

end

	t = setmetatable(t, mt);

	return t, mt;

end 		-- end table.metatable
]]



function table.create(name)

--[[	INSTANTIATE LOCALIZED _ENV TABLE	]]--		
	local _ENV = {};
	_ENV[name] = {};

--[[	INSTANTIATE INITIAL TABLE VALUES	]]--
	local table = _ENV[name];
	table['self'] = _ENV[name];
	table['name'] = name;
	table['parent'] = _ENV[name];

--[[	INSTANTIATE INITIAL MTABLE VALUES	]]--
	table['metatable'] 	= {}
	local metatable		= table['metatable'];
	metatable['self'] 	= table;
	metatable['metatable']['__index'] = function(functable, key, val)

		if	not getmetatable(functable) then
			setmetatable(functable, metatable);
		end

--[[	INSTANTIATE NESTED MTABLE VALUES	]]--			--print('__index :: ', self, table, '[', key, '] = ', val);
		local rawKey	= rawget(functable, key);
		local val = val;

		val				= ( type( rawKey ) 	~= 'nil' and rawKey )	or	{};
		val['parent']	= ( type( rawKey ) 	~= 'nil' and rawKey )	or	{};
		val['self']		= table;
		--val['this-key'] = key;
		--val['this-val'] = functable[key] or nil;					
		
		rawset(table, key, val)
		setmetatable(table[key], metatable)
		return val

	end

	setmetatable(table, metatable);
	return table, metatable;

end

--[[
	setmetatable(table, function(table, key, val)
		if	not getmetatable(table) then
			setmetatable(table, ZerkzMeta);
		end
		local val =  table[key] or {};
		--print('__index :: ', self, table, '[', key, '] = ', val);
		rawset(table, key, val)
		setmetatable(table[key], ZerkzMeta)
		return val
	end)
	return table;
end
]]

--[[
ZerkzMeta = {};
ZerkzMeta['self'] = ZerkzMeta;
ZerkzMeta['self-string'] = 'ZerkzMeta';
ZerkzMeta['self-parent'] = ZerkzMeta;
ZerkzMeta['this-key'] = key;

ZerkzMeta.__index = function(table, key, val)
	if	not getmetatable(table) then
		setmetatable(table, ZerkzMeta);
	end
	local val =  table[key] or {};
	--print('__index :: ', self, table, '[', key, '] = ', val);
	rawset(table, key, val)
	setmetatable(table[key], ZerkzMeta)
	return val
end
__index = function(table, key, val)
	local val =  table[key] or {};
	rawset(table, key, val)
	setmetatable(table[key], ZerkzMeta)
	return val
end

Meta = setmetatable({}, ZerkzMeta);
Meta['Methods']['__index'] = function(table, key, val)
	local val =  table[key] or {};
	rawset(table, key, val)
	setmetatable(table[key], ZerkzMeta)
	return val
end

table['metamethods']['__index'] = function(table, key, val)
	local val =  table[key] or {};
	rawset(table, key, val)
	setmetatable(table[key], ZerkzMeta)
	return val
end
]]



function table.new(self, tableResource, tableName) 

	if	type(tableResource) == 'table' then
		
		local tableLevel = tableResource['table.level'] or nil;

		if type(tableResource['table.level']) ~= 'number' then
		
			tableResource['table.level'] = 1;
			
		end			

		if	type(tableResource[tableName]) ~= 'table'	then
			
			tableResource[tableName] = {};
			tableResource[tableName]['table.root'] = tableResource;
			tableResource[tableName]['table.name'] = tableName;
			tableResource[tableName]['table.level'] = 1

			return tableResource[tableName];

		end
		local destinationResource = tableResource[tableName];
		

	end

end



function is_null(v)
	if	v == nil  then
		return true, nil;
	elseif v ~= nil  then
		return false, v;
	end
end



function isset(var, passthrough)
	if	var == nil	then
		return nil, false; 
	else
		return var, true;
		--[[
		if passthrough == true or passthrough == 'true' then
			return true, var;
		else
			return true;
		end
		]]
	end
end



function count(var)
	if type(var) == 'table' then
	--[[local count = table.getn(var) or #var or 0;
		if	not count or tonumber(count) == (0 or '0') then	
			]]
			--local __i;
			local count;
			local _i;

			for i,_ in ipairs(var) do
				count = i;  -- to be used outside of loop
				_i = i or ( ( __i or 0 ) + 1 )
			end

			return count or _i;
		--else
			--return count;
		--end
	elseif type(var) == 'string' and not tonumber(var) then
		return string.len(var) or 0;
	elseif type(tonumber(var)) == 'number' then 
		return tonumber(var);
	else
		return false;
	end
end


--[ DUMPVAR(var); ]--
function dumpvar(data)

	-- cache of tables already printed, to avoid infinite recursive loops
	local tablecache = {}
	local buffer = ""
	local padder = "    "

	local function _dumpvar(d, depth)
	
		local t = type(d)
		local str = tostring(d)
	
		if (t == "table") then
		
			if (tablecache[str]) then
				-- table already dumped before, so we dont
				-- dump it again, just mention it
				buffer = buffer.."<"..str..">\n";
			
			else
				tablecache[str] = (tablecache[str] or 0) + 1
				buffer = buffer.."("..str..") {\n";
			
				for k, v in pairs(d) do
					buffer = buffer..string.rep(padder, depth+1).."["..k.."] => "
					_dumpvar(v, depth+1);
				end
			
				buffer = buffer..string.rep(padder, depth).."}\n";
			
			end
		
		elseif (t == "number") then
			buffer = buffer.."("..t..") "..str.."\n";
		else
			buffer = buffer.."("..t..") \""..str.."\"\n";
		end
	
	end

	_dumpvar(data, 0);
	return buffer

end



--[=[	
	>>  REGEX  REFRESHER  >>
	s = "Deadline is 30/05/1999, firm"
	date = "%d%d/%d%d/%d%d%d%d"
	print(string.sub(s, string.find(s, date)))   --> 30/05/1999

The following table lists all character classes:
	.	all characters
	%a	letters
	%c	control characters
	%d	digits
	%l	lower case letters
	%p	punctuation characters
	%s	space characters
	%u	upper case letters
	%w	alphanumeric characters
	%x	hexadecimal digits
	%z	the character with representation 0

An upper case version of any of those classes represents the complement of the class. For instance, '%A' represents all non-letter characters.

You can make patterns still more useful with modifiers for repetitions and optional parts. Patterns in Lua offer four modifiers:
	+	1 or more repetitions
	*	0 or more repetitions
	-	also 0 or more repetitions
	?	optional (0 or 1 occurrence)
]=]--


function string.split(str, seperator, limit)

	local matches;
	local array 	= {};
    local regex 	= string.format("([^%s]+)", seperator);
    
	for match in string.gmatch(str,regex) do

		table.insert(array, match)
		matches = (matches or 0) + 1;

		if is_number(limit) and limit >= (#array or table.getn(array)) then
			break;
		end

	end

	return array

end



function string.explode(s, seperator, limit)
    
    if type(s) ~= 'string' then 
      return false; 
    end
	
	local seperator = is_string(seperator) or ' ';
    local limit = ( type(limit) == 'number' and limit ) or nil;
    local results;
    local results_i;
    local results_n;
    
    for match in string.gmatch(s, string.format('([^%s]+)', seperator)) do
        
        results_i = ( results_i or 0 ) + 1;
        
        if not results then 
            results = {};
        end

        table.insert(results, match);
        results_n = tonumber(#results) or tonumber(select("#", results)) or tonumber(count(results)) or tonumber(results_i);

        if ( limit and results_n and ( results_n >= limit ) ) then
          break;
        end
  
    end


    if type(results) ~= 'table' then
      return false; 
      
    elseif type(results) == 'table' and type(results_n) == 'number' and (results_n or results_i) > 0 then
        return results, unpack(results);
    
    else
        return false;
    end

end



function string.pfind(s, seperator, limit)
    
    if type(s) ~= 'string' then 
      return false; 
    end
    
    local limit = ( type(limit) == 'number' and limit ) or nil;
    local results;
    local results_i;
    local results_n;
    
    for match in string.gmatch(s, string.format('([^%s]+)', seperator)) do
        
        results_i = ( results_i or 0 ) + 1;
        
        if not results then 
            results = {};
        end

        table.insert(results, match);
        results_n = tonumber(#results) or tonumber("#", results) or tonumber(count(results)) or tonumber(results_i);

        if ( limit and results_n and ( results_n >= limit ) ) then
          break;
        end
  
    end


    if type(results) ~= 'table' then
      return false; 
      
    elseif type(results) == 'table' and type(results_n) == 'number' and (results_n or results_i) > 0 then
        return results, unpack(results);
    
    else
        return false;
    end

end


--[=[
function string:explode(s, pattern, limit)
    
    if type(s) ~= 'string' then 
      return false; 
    end
    
    local limit = ( type(limit) == 'number' and limit ) or nil;
    local results;
    local results_i;
    local results_n;
    
    for match in string.gmatch(s, pattern) do
        
        results_i = ( results_i or 0 ) + 1;
        
        if not results then 
            results = {};
        end

        table.insert(results, match);
        results_n = tonumber(#results) or tonumber("#", results) or tonumber(table.getn(results)) or tonumber(results_i);

        if ( limit and results_n and ( results_n >= limit ) ) then
          break;
        end
   
    end

    if type(results) == 'table' and type(results_n) == 'number' and (results_n or results_i) > 0 then
        if  (  results_n == 1  ) then 
            return (select(1, results));
        else
            return ( type(results) == 'table' and results ) or false, table.unpack(results);
        end
    else
        return false;
    end

end



--[ STRING.SPLIT (s, delimiter) ]--
function string.explode(s, pattern, limit)
	
	if s and type(s) == "string" then
		
		delimiter = delimiter or "%s";
		local results = {};
		local limit = is_number(limit) or nil;
		local i;
		--s:gsub("(%s+)", " ")

		for match in (s):gmatch(pattern) do

			table.insert(results, match);

			i = (i or 0) + 1;

			if	is_number(limit) and i >= limit then
				return results or false;
				--break;
			end
		
		end

		return results or false;

	end

end
]=]


--[ SPLIT_REALMCHAR (s, delimiter) ]--
function split_realmchar(RealmChar, delimiter)

	if s and type(s) == "string" then
		
		local delimiter = delimiter or "-";
		local results = {};
		RealmChar:gsub("(%s+)", "")
		
		for match in (RealmChar..delimiter):gmatch("(.-)"..delimiter) do
		
			table.insert(results, match);
		
		end

		return unpack(results); --result[1], result[2];

	end

end


--[ MERGE_REALMCHAR (realm, char) ]--
function merge_realmchar(realm, char)

	if type(realm) == "string" and type(char) == "string" then

		local realm = realm:gsub("(%s+)", "")
		local char  = char:gsub("(%s+)", "")


		local realmchar = realm .. "-" .. char;
	
		return realmchar;
	
	end
	
end


function UnitID_Token(unit_id, pattern, first, second)

	local	unitName, realmName		=	UnitName(unit_id);
			realmName				=	(  type(realmName) == 'string'  and realmName ~= ('' or 'nil')  and  realmName  )  or  GetRealmName();
			
	local	UnitIDs		=	{
		['player']		= "player";
		['target']		= "target";
		['focus']		= "focus";
		['mouseover']	= "mouseover";
		['softenemy'] 	= "softenemy";
		['softfriend']	= "softfriend";
		['softtarget'] 	= "softtarget";
		['pet']			= "pet";
	};
	local 	inputs		=	{ 
		['realm'] 		= realmName;
		['server']		= realmName;
		['unit'] 		= unitName; 		
		['character'] 	= unitName;
		['name'] 		= unitName;			
	}		
	local 	unit_id 	= 	is_string(unit_id) 	and keyMatch(unit_id, UnitIDs, 'v')	or 'player';
	local	pattern 	= 	is_string(pattern) 	or '%s-%s';
	local 	first 		= 	( is_string(first) 	and keyMatch(first, inputs, 'v') )	or	unitName;
	local 	second 		= 	( is_string(second) and keyMatch(second, inputs, 'v') )	or	realmName;			
	
	local	token 		= 	string.format( pattern, ( is_string(first) and ( keyMatch(first, inputs, 'v') or unitName ) ), is_string(second) and ( keyMatch(second, inputs, 'v') or unitName ) );
	return 	token, first, second;
		
end

function CharacterRealmID(first, second, format)

	local	character = {};
			character.name, character.realm	=	UnitName("player");
			character.realm					=	(  (  (type(character.realm) == 'string')  and (character.realm ~= ('' or 'nil'))  and  character.realm  )  or  GetRealmName()  );
			character.character				= 	character.name;

	--local	first 					=	(type(first) == 'string' and string.lower(first)) or nil;
	--local	second 					= 	(type(second) == 'string' and string.lower(second)) or nil;
	
	if	type(first) == 'string' and type(second) == 'string' then

		--first	=	(type(first) == 'string' and string.lower(first)) or nil;
		--second 	= 	(type(second) == 'string' and string.lower(second)) or nil;

		local	first	= stringMatch(first, character, 'v') or character[string.lower(first)] or nil; --rawget(character, string.lower(first)) or nil;
		local	second	= stringMatch(second, character, 'v') or character[string.lower(second)] or nil;
		local	format  = (type(format) == 'string' and format) or "%s-%s";

		--first	= stringMatch(first, character, 'v') or nil; --rawget(character, string.lower(first)) or nil;
		--second	= stringMatch(second, character, 'v') or nil;

		local formatted_string = string.format( format, first, second );

		if type(formatted_string) == 'string'  and  type(first) == 'string'  and  type(second) == 'string' then
			return formatted_string, first or nil, second or nil;
		else
			return false;
		end

	else
		return string.format( format, character.name, character.realm ) or false, character.name or nil, character.realm or nil;
	end

end


--[[
function UnitID_Token(format, uid, realm)

	local	UnitIDs = {
		['player']		= "player";
		['target']		= "target";
		['focus']		= "focus";
		['mouseover']	= "mouseover";
		['softenemy'] 	= "softenemy";
		['softfriend']	= "softfriend";
		['softtarget'] 	= "softtarget";
		['pet']			= "pet";
	};

	local	uid 						= (type(uid) == 'string' and string.lower(tostring(uid))) or "player";
	local	UnitID						= UnitIDs[uid] or "player";

	local	character = {};
			character.name, character.realm	=	UnitName(UnitID);
			character.realm					=	(  (  (type(character.realm) == 'string')  and (character.realm ~= ('' or 'nil'))  and  character.realm  )  or  GetRealmName()  );
			character.character				= 	character.name;

	--local	first 					=	(type(first) == 'string' and string.lower(first)) or nil;
	--local	second 					= 	(type(second) == 'string' and string.lower(second)) or nil;
	
	if	type(first) == 'string' and type(second) == 'string' then

		--first	=	(type(first) == 'string' and string.lower(first)) or nil;
		--second 	= 	(type(second) == 'string' and string.lower(second)) or nil;

		local	first	= stringMatch(first, character, 'v') or character[string.lower(first)] or nil; --rawget(character, string.lower(first)) or nil;
		local	second	= stringMatch(second, character, 'v') or character[string.lower(second)] or nil;
		local	format  = (type(format) == 'string' and format) or "%s-%s";

		--first	= stringMatch(first, character, 'v') or nil; --rawget(character, string.lower(first)) or nil;
		--second	= stringMatch(second, character, 'v') or nil;

		local formatted_string = string.format( format, first, second );

		if type(formatted_string) == 'string'  and  type(first) == 'string'  and  type(second) == 'string' then
			return formatted_string, first or nil, second or nil;
		else
			return false;
		end

	else
		return string.format( format, character.name, character.realm ) or false, character.name or nil, character.realm or nil;
	end

end
]]



function uppercase(str)
    if type(str) ~= 'string' then
        return false; 
    else
        return (str:gsub("^%l", string.upper));
    end
end

function GetChatFrameTab(frame)
	
	local frameName, frameTab;

	if	is_string(frame) then 
		
		frameName = frame;
		frameTab = frameName .. "Tab";

	elseif is_table(frame) then
		frameObj = frame;

	end

end


function GetCharacterToken(pattern, first, second)

	local	CharacterName, RealmName, pattern, seperator, token;
			CharacterName, RealmName 	= UnitName("player");
	 				 	   RealmName 	= (  ( type(RealmName) == 'string'  and (RealmName ~= ('' or 'nil') )  and  RealmName )  or  GetRealmName()  );
	
	local inputs = { 
		['character'] = CharacterName;
		['realm'] = RealmName;
	}
	
	local first	= stringMatch ()
	
	seperator 	= ( string.len(pattern) == 1 and pattern ) or ( pattern == ( '.' or '.' or '-' or ':' ) and pattern ) or nil;
	pattern 	= ( seperator and tostring("%s"..tostring(seperator).."%s") ) or ( is_string(pattern) and pattern ) or '%s.%s';
	token 		= string.format(pattern, CharacterName, RealmName)



end

function Format_CharacterID(token, seperator)

	local seperator = seperator or '-';
	local results = {};
	local results_i;
	local result;
	for result in token:gmatch('[. -/]-(%w+)[. -/]-') do
		--table.insert(results, result);
		results_i = (results_i or 0) + 1;
		results[results_i]= uppercase(string.lower(result));
		_G[AddOnName]:Print( 'General',		i, '::', result, '::', results_[results_i] )--..':'..v or ''); 
	end

	if ( ( #(results) or results_i ) == 2 ) then	
		return (tostring(results[1])..tostring(seperator)..tostring(results[2])), results[1], results[2];
	elseif ( ( #(results) or results_i ) == 1 ) then
		return results[1];
	else
		return false;	
	end

end



function AddOne(int_varname)

	--local val = rawget(_G, int_varname) or 0;
	--local new_val = val + 1;
	
	if type(int_varname) ~= 'string' then
		return false;
	end

	rawset(_G, int_varname, (rawget(_G, int_varname) or 0) + 1);

	return rawget(_G, int_varname);

end
--[[
math = math or {};

function math:increase(varname, incease_val, start_val)

	if not varname or type(varname) ~= 'string' then
		return false;
	end

	math.__temp = math.__temp or {};
	
	local start_val = start_val or 0;
	
	math.__temp[varname] = math.__temp[varname] or start_val;

	local last_val = math.__temp[varname] or start_val;
	local new_val = last_val + (increase_val or 1)
	
	return new_val or last_val + 1;

end

]]

function ZCfgPrint(string, ...)
	
	local AddOn = _G["ScriptName"] or "ZerkinzConfig";

	if type(string) == "string" then
	
		print("|cff66FF11[" .. AddOn .. "]|r: |cffCCFF55'" .. tostring(string) .. "';");
	
	end

end


--[ METHOD EXISTS (obj, method, args, ...); ]--
function methodExists(obj, method, args, ...)

local method;

	if obj and type(obj) == "table" and method then
	
		for k,v in pairs(obj) do
		
			--ZCfgPrint(tostring(k), type(v));
		
			if type(v) == "function" and string.lower(method) == string.lower(k) then
				
				
				--ZCfgPrint("|cffFFFF00Calling :: ", tostring(obj), "[", tostring(method), "]", "(", tostring(obj), ", ...);|r");

				method = k;
				--obj[method](...);
			
				--ZCfgPrint("|cffFFFF00Calling :: ", tostring(obj), "[", tostring(method), "]", "(", tostring(obj), ", ...);|r");
			
				return true, method;
			
			else
			
				-- do nothing; continue loop..
			
			end
		
		end
	
	else
	
		return false;
	
	end

end


--[ CALLMETHOD (obj, method, args, ...); ]---
function callMethod(obj, method, args, ...)

	if obj and type(obj) == "table" and method then
	
		for k,v in pairs(obj) do
		
			ZCfgPrint(tostring(k), type(v));
		
			if type(v) == "function" and string.lower(method) == string.lower(k) then
				
				
				--ZCfgPrint("|cffFFFF00Calling :: ", tostring(obj), "[", tostring(method), "]", "(", tostring(obj), ", ...);|r");

				method = k;
				obj[method](...);
			
				ZCfgPrint("|cffFFFF00Calling :: ", tostring(obj), "[", tostring(method), "]", "(", tostring(obj), ", ...);|r");
			
				return true;
			
			else
			
				-- do nothing
			
			end
		
		end
	
	else
	
		return false;
	
	end

end



function arrayKeys(arrayInput, tableKeys)

	if not arrayInput or type(arrayInput) ~= "table" then
	
		return false;
	
	elseif type(arrayInput) == "table" then -- arrayInput NOT nil
	
		if tableKeys == "true" or tableKeys == true then tableKeys = true; else tableKeys = false; end
			
			local i = 0;
			
			for k,v in pairs(arrayInput) do
				
				if not tableKeys or tableKeys == false then
			
					i = i + 1;
		
				elseif tableKeys == true and type(v) == "table" then
					
					i = i + 1;	
				
				end
				
			end
		
			return i;
		
		end -- type(arrayInput)

	return 0;

end -- end function arrayKeys()



function copyTable(from, to)
	
	if 	not to or to and type(to) ~= "table" then
		
		to = {}; --[[DEBUG: print("not to or to and type(to) ~= table, creating blank table"); ]]
	
	end


	if 	from and type(from) == "table" and to and type(to) == "table" then
	
		--DEBUG: print("pre copyTable for k,v");
	
		for k,v in pairs(from) do
			
			--DEBUG: print(tostring(from), tostring(k), tostring(v), tostring(to))
			to[k] = v;
		
		end
	
		return to;
	
	else
	
		--DEBUG: print("failed to make it past copyTable conditions")
	
		return false;
	
	end

end



function keyMatch(str, arr, return_val, caseSensitive)
	
	if	type(str) ~= ('string' or 'number') or type(arr) ~= ('table' or 'userdata') then 
		return false;
	end

	if	( caseSensitive ~= ('false' or false) ) and ( caseSensitive == ('true' or true) ) then 
		caseSensitive = true;
	elseif	caseSensitive == (false or 'false' or nil) then
		caseSensitive = false;
	else	
		caseSensitive = nil;
	end	

	if 	type(str) == "string" and type(arr) == "table" then

		--[[
		if 	type(return_val) == 'string' then

			return_values	= { ['k'] = 'k'; ['key'] = 'k'; ['v'] = 'v'; ['val'] = 'v'; ['value'] = 'v'; }
			return_value	= ( is_string(return_val) or is_number(return_val) ) and keyMatch(return_val, return_values, 'v', (is_boolean(caseSensitive) or false) ) or 'k'; 
			return_value	= ( return_val ~= (nil or false) and tostring(return_val or 'k') ) or 'k';

		else	
			return_value = ( type(return_val) == 'string' and ( return_val == ('k' or 'key') and 'k') or ( return_val == ('v' or 'val' or 'value') and 'v' ) ) or 'k';
		end
		]]

		local	return_values;
		local	return_value = return_val or nil;

		return_value = ( type(return_val) == 'string' and ( ( ( string.lower(return_val) == ('k' or 'key') ) and 'k') or ( string.lower(return_val) == ('v' or 'val' or 'value') and 'v' ) ) ) or 'k';

		if 	type(return_val) ~= 'string'  then
			return false;
		end

			for	k,v in pairs(arr) do
			--local r_val	= ( is_string(return_value) and row[return_value] ) or (row['k'] or k);
			--[[if	r_val == nil then
				if	type(return_val) ~= 'string' or ( is_string(return_val) and string.lower(return_val) == ('k' or 'key' ) )  then
					r_val	= k;
				elseif	(is_string(return_val)) and string.lower(return_val) == ('v' or 'val' or 'value' )  then
					r_val	= v;		
				end
			end]]			
			local row	= { ['k'] = k; ['v'] = v; };
			local r_val = row[return_value] or k or nil;

			if 	not caseSensitive and string.lower(str) == string.lower(k) then
				return (r_val or k), k, v;
			elseif caseSensitive and str == k then
				return (r_val or k), k, v;
			end--continue  

		end
	else
		return false;
	end
end



function stringMatch(str1, str2, toReturn, caseSensitive)

	if		caseSensitive	then caseSensitive = true;
	elseif	not caseSensitive	then caseSensitive = false;
	else	caseSensitive = nil; end

	local caseSensitive = caseSensitive or nil;
	
	if	( type(str1) == "string" ) and ( type(str2) == "table" ) then
	
		local found; 
	
		for k,v in pairs(str2) do
			
			--print(str1, "<>", k);
		
			if 	not caseSensitive and string.lower(str1) == string.lower(k) then
				
				--DEBUG: print(string.lower(str1), "==", string.lower(k));
				if toReturn == "v" then 
					return v, k 
				else 		
					return k, v;
				end
			
			elseif	caseSensitive and str1 == k then
				
				--DEBUG: print(str1, "==", k)
				if toReturn == "v" then 
					return v, k 
				else 		
					return k, v;
				end

			end
		
		end

		return false;
	
		--if	found == true then
			--return true;
		--else
			--return false;
		--end
	
	elseif	str1 and str2 and type(str1) == "string" and type(str2) == "string" then
	
		if not caseSensitive and string.lower(str1) == string.lower(str2) then

			return str2;

		elseif	caseSensitive and str1 == str2 then

			return str2;

		else

			return false;

		end
	
	else -- if not str1 and str2 
		
		return false;
	
	end -- end if str1 and str2

end -- end function strMatch



function	is_blacklisted(s, blacklist_table)

	local	self = is_table(_G[AddOnName]) or is_table(getglobal(_G, 'ZerkinzConfig'));
	local	blacklist_table	= is_table(blacklist_table) or is_table(self.DevConsole.Blacklist);

	if 	is_table(blacklist_table)	and		is_string(s)	then

		if	rawget(blacklist_table, s) or keyExists(s, blacklist_table)	then
			return true;
		else
			return false;
		end			
	
	else
		return false;
	end

end

	

function print_r(array, arrayName, searchedArrays)

	local searchedArrays	= 	( type(searchedArrays) == 'table' and searchedArrays ) or {};
	local tablePattern 		= 	"|> ['%s'] = { %s };";
	local keyPattern		= 	"|> ['%s'] = | %s |;";
	local array				= 	( type(array) == ('table' or 'userdata') and array ) or ( type(array) == 'string' and is_table(rawgetval(array)) )
	local arrayName 		= 	( type(arrayName) == 'string' and arrayName ) or ( is_table(array) and (array.__name or array.name or array.__tostring or tostring(array)) ) or ( array and tostring(array) );

	if	not array or type(array) ~= ("table" or "userdata") then
		return false;
		
	elseif	type(array) == ("table" or "userdata") then
			
		searchedArrays[tostring(array)] = tostring(array);

		print( string.format( tablePattern, tostring(arrayName), tostring(array) ) );
			
		for k,v in pairs(array) do

			if	type(v) == "table"   then
					
				if	type( searchedArrays[tostring(array)] ) ~= 'nil' --[[and type(searchedArrays[tostring(array)]) == ('string')]] or type(array) == ('userdata' or 'table') and type(array.GetName) == ('function')	then 
					--print( string.format( tablePattern, tostring(arrayName or tostring(array)), tostring('HAS ALREADY BEEN searchedArrays! SKIPPING..') ) );
				else
					print_r(v, k, searchedArrays);
				end
				--[[
				print( k .. " => " .. type(v) )
				for	key, val in pairs(v) do 
					print("|----  [" .. key .. "] => [" .. tostring(val) .. "];");
				end
				]]
			else
				print( string.format( keyPattern, tostring(k), tostring(v) ) );
				--print("[" .. k .. "] => [" .. tostring(val) .. "];");
			end
		end	
	end -- end for {} do
end -- end function printArray()		



function printArray(array, arrayName, searchedArrays, i_tbl)

	local searchedArrays = ( type(searchedArrays) == 'table' and searchedArrays ) or {};
	local tablePattern 	= '|%s|={ %s }=|:';
	local keyPattern	= "|%s|::[%s]='%s';";

	if	not array or type(array) ~= "table" then
		return false;
	elseif	type(array) == "table" then
		
		searchedArrays[tostring(array)] = tostring(array);
		local i_tbl = (i_tbl or 0) + 1;
		local i_key;

		print( string.format( tablePattern, tostring(arrayName), tostring(array) ) );
		
		for k,v in pairs(array) do
			i_key = (i_key or 0) + 1;
			if	v and type(v) == "table" then
				
				if	type( searchedArrays[tostring(array)] ) ~= 'nil'	then 
					--print( string.format( tablePattern, tostring(arrayName or tostring(array)), tostring('HAS ALREADY BEEN searchedArrays! SKIPPING..') ) );
				else
					i_tbl = (i_tbl or 0) + 1;
					printArray(v, k, searchedArrays, i_tbl);
				end
				--[[
				print( k .. " => " .. type(v) )

				for	key, val in pairs(v) do 
					print("|----  [" .. key .. "] => [" .. tostring(val) .. "];");
				end
				]]
			else
				print( string.format( keyPattern, i_key, tostring(arrayName), tostring(array) ) );
				--print("[" .. k .. "] => [" .. tostring(val) .. "];");
			end
		end	
	end -- end for {} do
end -- end function printArray()



function EventManager(eventName, eventAction, eventFrameObj, eventFrameName)

	local self = _G[AddOnName];

	if not eventAction or not eventName then

		return false;

	elseif type( self["Frames"]["Events"] ) ~= "table" then

		self.Initialize:EventsFrame();

	end

	local ZerkinzConfig = _G[AddOnName]; 
	
	if	eventFrameObj and type(eventFrameObj) == "table" then

		if	eventAction == "Register" then

			_G[AddOnName]["Frames"]["Events"]:RegisterEvent(eventName);			

		elseif eventAction == "Unregister" then

			_G[AddOnName]["Frames"]["Events"]:UnregisterEvent(eventName); --SetScript(); 

		end

	end

	eventFrameObj = eventFrameObj or {}


end
