--MyPluginName = MyPluginName or "ZerkinzCVars";
--local onLoad_msg = "To support Zerkinz create his ever expanding suite of AddOns, WeakAuras, Libraries, etc., please direct it to www.tinyurl.com/SupportZerkinzUI. Thanks in advance, as I am completely broke; literally, even $0.50 is appreciated; it all adds up.";

--	ZerkinzConfig = LibStub("AceAddon-3.0"):NewAddon("ZerkinzConfig", "AceConsole-3.0");

	--local AddOnName, Engine = ...
	--ZerkinzConfigEvents = LibStub("AceEvents-3.0"):NewAddon("ZerkinzConfigEvents", "AceCallBackHandler-1.0");--:NewAddon("ZerkinzConfigEvents", "AceConsole-3.0");
	--local CallbackHandler = LibStub("CallbackHandler-1.0")
	--local AceEvent = LibStub("AceEvents-3.0"):NewAddon("ZerkinzConfig", "AceConsole-3.0");
	--local MAJOR, MINOR = "AceEvent-3.0", 4
	--local AceEvent = LibStub:NewLibrary(MAJOR, MINOR)

	--local _G = _G;
	--AceEvent:Embed(ZerkinzConfig);

	--local _G = _G;

	--local AddOnName, _ENV = ...;
	addonName = 'ZerkinzConfig';
	--nameSpace = nameSpace or {}; 

	local AceAddon, AceAddonMinor				= _G.LibStub('AceAddon-3.0')
	local CallbackHandler						= _G.LibStub('CallbackHandler-1.0')
	--local _Profiles = ZerkinzConfig["Profiles"] or {}; 
	--LibStub("AceAddon-3.0"):NewAddon("MyAddon")
	--[[
																							<Include file="Libraries\AceAddon-3.0\AceAddon-3.0.xml"/>
																							<Include file="Libraries\AceComm-3.0\AceComm-3.0.xml"/>
																							<Include file="Libraries\AceConfig-3.0\AceConfig-3.0.xml"/>
																							<Include file="Libraries\AceConsole-3.0\AceConsole-3.0.xml"/>
																							<Include file="Libraries\AceDB-3.0\AceDB-3.0.xml"/>
																							<Include file="Libraries\AceDBOptions-3.0\AceDBOptions-3.0.xml"/>
																							<Include file="Libraries\AceEvent-3.0\AceEvent-3.0.xml"/>
																							<Include file="Libraries\AceGUI-3.0\AceGUI-3.0.xml"/>
																							<Include file="Libraries\AceLocale-3.0\AceLocale-3.0.xml"/>
																							<Include file="Libraries\AceSerializer-3.0\AceSerializer-3.0.xml"/>
																							<Include file="Libraries\AceTimer-3.0\AceTimer-3.0.xml"/>
																							<Include file="Libraries\AceLocale-3.0\AceLocale-3.0.xml"/>
																							<Include file="Libraries\AceHook-3.0\AceHook-3.0.xml"/>
	]]

	--[[ Setup AddOn w/ Ace .. ]]
	_G.AddOnName								= 'ZerkinzConfig';
	_G[AddOnName] 								= ( type(_G[AddOnName]) == 'table' and _G[AddOnName] ) or {};-- or {__name = _G.AddOnName, __parent = _G };


	_G[AddOnName] 								= AceAddon:NewAddon( AddOnName, 'AceComm-3.0', 'AceConsole-3.0', 'AceEvent-3.0', 'AceSerializer-3.0', 'AceTimer-3.0', 'AceHook-3.0' );
	--_G['AceAddon']							= AceAddon:SetDefaultModuleLibraries('AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0', 'AceHook-3.0');  
	_G[AddOnName]['Meta'] 						= {};
	_G[AddOnName]['Meta'] 						= table.copy(getmetatable(_G[AddOnName]), _G[AddOnName]['Meta']) or nil;	
	_G[AddOnName], _G[AddOnName]['Meta']		= table.metatable( _G[AddOnName], _G[AddOnName]['Meta']) --_G['MetaTable'] ) );
	--_G[AddOnName]								= setmetatable(_G[AddOnName], _G[AddOnName]['Meta']);
											  

	--[[ ZERKiNZconfig:__CONSTRUCT FUNCTION ]]--
	-- [[

	--]]



	function	ZerkinzConfig:__construct(...)
		
		local self = self or _G[AddOnName];
		local meta = getmetatable(self) or nil;
		--local construct_list = {};

		local TableNames = {
		
			["AddOn"]					= "AddOn";
			["Initialize"]				= "Initialize";
			["LoadedModules"]			= "LoadedModules";
			["Profiles"] 				= "Profiles";
			["Actions"]					= "Actions";
			["Events"] 					= "Events";
			["Functions"] 				= "Functions";
		
				--_G[AddOnName]["EventFunctions"]		= {};
				--_G[AddOnName]["Events"]["States"]		= {};
		
			["EventFunctions"]			= "EventFunctions";
			["LaunchPad"]				= "LaunchPad";
			["Methods"]					= "Methods";
			["Modules"]					= "Modules";
			["ChatWindows"]				= "ChatWindows";	

		}

		local t_count = 0;

		for k,v in pairs(TableNames) do
			local table_exists = is_table( rawget(self, v) ) or is_table( rawset(self, v, {}) );
			t_count = (t_count or 0) + 1;
		end

		ZerkinzConfig:Print('General', ' -> ( ' .. tostring(t_count) .. ' ) tables were successfully constructed.')
		--[[
		self["AddOn"]					= self["AddOn"] or {};
		self["Initialize"]				= self["Initialize"] or {};
		self["LoadedModules"]			= self["LoadedModules"] or {};
		self["Profiles"] 				= self["Profiles"] or {};
		self["Actions"]					= self["Actions"] or {};
		self["Events"] 					= self["Events"] or {};
		self["Functions"] 				= self["Functions"] or {};
	
			--_G[AddOnName]["EventFunctions"]		= {};
			--_G[AddOnName]["Events"]["States"]		= {};
	
		self["EventFunctions"]			= self["EventFunctions"] or {};
		self["LaunchPad"]				= self["LaunchPad"] or {};
		self["Methods"]					= self["Methods"] or {};
		self["Modules"]					= self["Modules"] or {};
		self['ChatWindows']				= self['ChatWindows'] or {};		
		
		]]

		if	is_table(meta) then
			rawset(meta, '__constructed', true);
		end
		--_G['AddOnMeta']['__constructed'] = true;
	
		return self, true, t_count;
	
	end	

	--ZerkinzConfig:__construct(construct_tables('ZerkinzConfig'));
	ZerkinzConfig:__construct();

	--ZerkzMeta['Print']						= rawget(getmetatable(_G[AddOnName]), 'Print');
	--local __MT 								= getmetatable(_G[AddOnName]) or rawget(_G[AddOnName], '__metatable');
	--_G[AddOnName]['Print'] 					= 
												 --rawset(_G[AddOnName], 'Print', rawget(__MT, 'Print') or _G[AddOnName]['Print'] );
	--[[ZerkinzConfig.Print ]]					 	

	--[[ _G.MetaTable ]]				
	--local AddOnPrint = rawget(ZerkinzConfig, 'Print');
	--local __MT = getmetatable(_G[AddOnName]) or rawget(_G[AddOnName], '__metatable');
	--rawset(ZerkinzConfig, 'Print', nil);
	--rawset(_G['MetaTable'], 'Print',  rawget(__MT, 'Print') or rawget(_G[AddOnName], 'Print'));
	--_G['MetaTable']['Print'] 					= rawget(_G[AddOnName], 'Print')

												  --setmetatable(_G[AddOnName], ZerkzMeta);

	--_G[AddOnName]								= ZerkinzConfig:SetDefaultModuleLibraries('AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0', 'AceHook-3.0');
	--_G[AddOnName]								= LibStub("AceAddon-3.0"):NewAddon(_G['AddOnName']);
	 												--rawget(ZerkinzConfig, 'Print');
	--_G['AceMeta'] 								= getmetatable(ZerkinzConfig);
	--ZerkinzConfig:Print("General", "TEEEST@@@@@@@@@@@@@@@@@@@@@@");
	--_G['ZerkinzAceMeta'] 						= rawget(ZerkinzConfig, '__metatable');
	--_G[AddOnName]['MetaTable']					= {};
	--_G["MetaTable"] 							= {};
	--_G[AddOnName], _G['MetaTable']				= table.metatable( _G[AddOnName],		_G['MetaTable'] );

	--[[
	local LaunchPad_Meta = { __temp = { constructed = false } };
	LaunchPad_Meta['__construct'] = function(...)
	end ]]
	--local ZerkinzMT = getmetatable(ZerkinzConfig) or nil;
	

	--[[ ZERKiNZconfig:__CONSTRUCT FUNCTION ]]--
	--[[
	function	ZerkinzConfig.MetaTable:__construct(func, ...)
		
		local self = self or _G[AddOnName];

		self["AddOn"]					= self["AddOn"] or {};
		self["Initialize"]				= self["Initialize"] or {};
		self["LoadedModules"]			= self["LoadedModules"] or {};
		self["Profiles"] 				= self["Profiles"] or {};
		self["Actions"]					= self["Actions"] or {};
		self["Events"] 					= self["Events"] or {};
		self["Functions"] 				= self["Functions"] or {};

		--_G[AddOnName]["EventFunctions"]		= {};
		--_G[AddOnName]["Events"]["States"]		= {};

		self["EventFunctions"]		= self["EventFunctions"] or {};
		self["LaunchPad"]				= self["LaunchPad"] or {};
		self["Methods"]					= self["Methods"] or {};
		self["Modules"]					= self["Modules"] or {};
		self['ChatWindows']				= self['ChatWindows'] or {};		

		_G['AddOnMeta']['__constructed'] = true;

		return true, self;

	end

	ZerkinzConfig.MetaTable.__call = function(func, ...)

		local self = self or _G[AddOnName];
		local is_constructed = rawget(_G['AddOnMeta'],  '__constructed');-- or rawget(_G[AddOnName]['AddOn'],  '__constructed') or false;
		local __construct_return;

		if	is_constructed ~= true then --type(is_constructed) == 'boolean' and is_constructed ~= true then
			__construct_return = ZerkinzConfig('__construct');
			rawset( _G['AddOnMeta'],  '__constructed', ((__construct_return ~= nil and __construct_return) or false) );
			self['AddOn']['__constructed'] = ((__construct_return ~= nil and __construct_return) or false);

		else
			self['AddOn']['__constructed'] = true;
			rawset( _G['AddOnMeta'],  '__constructed', ((is_constructed ~= nil and is_constructed) or false) );
			__construct_return = self['AddOn']['__constructed'] or true;
		end
		
		return __construct_return or is_constructed or nil;

	end]]


	--[[
	function	ZerkinzConfig:__construct(func, ...)	--			= function(func, ...)

		local self = self or _G[AddOnName];

		self["AddOn"]					= self["AddOn"] or {};
		self["Initialize"]				= self["Initialize"] or {};
		self["LoadedModules"]			= self["LoadedModules"] or {};
		self["Profiles"] 				= self["Profiles"] or {};
		self["Actions"]					= self["Actions"] or {};
		self["Events"] 					= self["Events"] or {};
		self["Functions"] 				= self["Functions"] or {};

		--_G[AddOnName]["EventFunctions"]		= {};
		--_G[AddOnName]["Events"]["States"]		= {};

		self["EventFunctions"]	= self["EventFunctions"] or {};
		self["LaunchPad"]			= self["LaunchPad"] or {};
		self["Methods"]				= self["Methods"] or {};
		self["Modules"]				= self["Modules"] or {};
		self['ChatWindows']			= self['ChatWindows'] or {};

		return true;

	end]]

	--setmetatable(_G[AddOnName], _G['AceMeta'])
	--rawset(ZerkinzConfig, '__metatable', _G['AceMeta'])
	--print('|cff00FFFF[ OG METATABLES ] >>>> ', _G['AceMeta'], _G['ZerkinzAceMeta'], getmetatable(ZerkinzConfig));

	--local 	ZerkinzConfig					= {};
			--ZerkinzConfig 					= AceAddon:NewAddon(ZerkinzConfig or {}, "ZerkinzUI", 'AceConsole-3.0', 'AceTimer-3.0', 'AceHook-3.0');
	--_G.AddOnName = "ZerkinzConfig";
	--[[>>	INSTANTIATE CORE META TABLE ..	>>]]--
	--[[
	ZerkinzMeta 							= {}
	--ZerkinzMeta 							= {};
	ZerkinzMeta['root']			= ZerkinzMeta;
--	ZerkinzMeta['Print'] 		= _G[AddOnName]['Print'];
	ZerkinzMeta['__index'] 		= function(table, key, val)
		local metaself	= ZerkinzMeta;
		local self 		= table;
		local val =  val or {};
		
		if 	type( rawget(self, 'Print') ) == 'function' then
			ZerkinzConfig:Print("General", '__index :: ', table, '[', key, '] = ', val, ';', self, metaself );
		else
			print('|cff0099FF__index :: ', table, '[', key, '] = ', val, ';', self, metaself );
		end

		rawset(table, key, val)
		rawset(table, key, setmetatable( rawget(table, key), metaself ) );
		return val
	end]]


	--_G[AddOnName]['MetaTable']					= ZerkinzMeta;
	--_G[AddOnName] = setmetatable( _G[AddOnName],		_G[AddOnName]['MetaTable'] );
	--_G[AddOnName]['MetaTable']					= {};
	--_G[AddOnName], _G[AddOnName]['MetaTable']	= table.metatable( _G[AddOnName],		_G[AddOnName]['MetaTable'] );

	--_G[AddOnName], _G[AddOnName]['MetaTable']	= table.metatable(_G[AddOnName], _G[AddOnName]['MetaTable']);	



	--[[
	_G[AddOnName]['MetaTable']['__index']	= function(table, key, val)
		local val =  val or {};
		print('__index :: ', self, table, '[', key, '] = ', val);

		rawset(table, key, val)
		setmetatable(table[key], ZerkinzConfig['MetaTable'])
		return val
	end
	]]



--[[
	function	ZerkinzConfig.Actions:Print("General", message)
		
		local AddOn = _G[AddOnName];
		AddOn:Print("General", message);
	
	end

	function	ZerkinzConfig.Methods:Print("General", message)
		
		local AddOn = _G[AddOnName];
		AddOn:Print("General", message);
	
	end

	function	ZerkinzConfig.EventFunctions:Print("General", message)
		
		local AddOn = _G[AddOnName];
		AddOn:Print("General", message);
	
	end

	function	ZerkinzConfig.Modules:Print("General", message)
		
		local AddOn = _G[AddOnName];
		AddOn:Print("General", message);
	
	end

	]]

	--[=[
	function	ZerkinzConfig:Launch()

		local self = _G[AddOnName];

		if	self.initialized == true then
			
			return true;
		
		else

		local self	= _G[AddOnName];

		self.scriptStart = GetTime();

		-- [[	Call Compartmentalized Initialization Objects/Methods	]] --
				self:InstantiateConsoleCommands();
				self:InstantiateCoreArrays();
				self.Initialize:Profiles();
				self.Initialize:EventsFrame();
				self.Initialize:ConsoleCommands();
				--self.Initialize:ConsoleWindow('ZerkinzConsole');
				self:InstantiateCoreArrays("true");
				self.Initialize:ProfileModules();
	
				ZerkinzConfig:Print("General", "|cffFFFF00=========================|r");
			
				ZerkinzConfig:Print("General", "|cffFF0000ZerkinzCfgAcct['activated_modules']:");
				self:printArray(ZerkinzCfgAcct["activated_modules"]);
				ZerkinzConfig:Print("General", "|cffFF0000ZerkinzCfgChar['activated_modules']:");
				self:printArray(ZerkinzCfgChar["activated_modules"]);	
			
			
				self:AcceptPopUp("Accept", "Disable");	
			
				ZerkinzConfig:Print("General", '|cff66FF11' .. tostring(self) .. " => OnInitialize() complete.")
				ZerkinzConfig:Print("General", '|cffFF9900OnInitialize( ', tostring(args or 'args were supposed to be here.. lol'), ' );');
	
				self.scriptEnd = GetTime();
				self.scriptExecution = ( tonumber(self.scriptEnd) or GetTime() ) - ( tonumber(self.scriptStart) or GetTime() );
				self.initialized = true;
	
				ZerkinzConfig:Print("General", ":|cff00FFFFOnInitialize()|r was |cff66FF11executed in|r ", self.scriptExecution, " |cff66FF11seconds.|r");		
	
				return true;

		end

	end

	]=]



	function ZerkinzConfig:Launcher(moduleName, excluded_modules, ...)

		ZerkinzConfig['UnloadedModules']	= ZerkinzConfig['UnloadedModules'] or {};
		ZerkinzConfig['Modules']			= ZerkinzConfig['Modules'] or {};
		ZerkinzConfig["LaunchChecklist"]	= ZerkinzConfig["LaunchChecklist"] or {};

		local excluded_modules = ( type(excluded_modules) == 'table' and excluded_modules ) or {};

		for moduleKeyName, moduleMethod in pairs(self.UnloadedModules) do
		
			if 	stringMatch(moduleName, excluded_modules) then
				-- do not launch this module;
			else
				local module_result = moduleMethod(...) or false;
				self["LauncherChecklist"][moduleKeyName] = module_result;
				self:Print("ZerkinzConsole", "LaunchChecklist[", moduleKeyName, "] ")
			end

		end



	end


	function ZerkinzConfig.Initialize:Profiles(...)

		local this = self;
		local self = _G[AddOnName]; 

		--_G.ZerkinzCfgAcct			= _G.ZerkinzCfgAcct or {};
		--_G.ZerkinzCfgChar			= _G.ZerkinzCfgChar or {};
		--_G.ZerkinzConfig.Profiles	= _G.ZerkinzConfig.Profiles or {};

		local CharacterName, CharacterRealm = UnitName("player");
		local 				 CharacterRealm = (  (  (type(CharacterRealm) == 'string')  and (CharacterRealm ~= ('' or 'nil'))  and  CharacterRealm  )  or  GetRealmName()  );
		local RealmName 					= CharacterRealm;

		_G['__ZerkinzConfig_Account']	=	( type(_G['__ZerkinzConfig_Account']) == 'table' and _G['__ZerkinzConfig_Account'] ) or {};
		_G['__ZerkinzConfig_Character']	=	( type(_G['__ZerkinzConfig_Character']) == 'table' and _G['__ZerkinzConfig_Character'] ) or {};

		self.__Session				= ZerkinzConfig.__Session or {};
		self.__Session['Character'] = CharacterName;
		self.__Session['Realm']		= CharacterRealm;

		self.__AccountProfile 		=	self.__AccountProfile or {};
		self.__CharacterProfile 	= 	self.__CharacterProfile or {};

		self.__Profiles				=	self.__Profiles or {};
		self.__Profiles.Account		=	__ZerkinzConfig_Account;
		self.__Profiles.Character	= 	__ZerkinzConfig_Character;
		--ZerkinzConfig:Print("General", CharacterName, "-", CharacterRealm);

		_G.ZerkinzCfgAcct			= _G.ZerkinzCfgAcct or {};
		_G.ZerkinzCfgChar			= _G.ZerkinzCfgChar or {};
		--ZerkinzConfig 				= _G.ZerkinzConfig;


		--[[ Add 1 to the Login Count ]]-- 

		ZerkinzCfgAcct.loginCount = ( ZerkinzCfgAcct.loginCount or 0 ) + 1;
		ZerkinzCfgChar.loginCount = ( ZerkinzCfgChar.loginCount or 0 ) + 1;		

		ZerkinzCfgChar["ActiveProfile"]									=	ZerkinzCfgChar["ActiveProfile"] or "Character";

		ZerkinzConfig["Profiles"]										= 	ZerkinzConfig["Profiles"] or {};
		ZerkinzConfig["Profiles"]["Account"]							= 	ZerkinzConfig["Profiles"]["Account"] or {};
		ZerkinzConfig["Profiles"]["Character"]							= 	ZerkinzConfig["Profiles"]["Character"] or {};
		

		local ProfilesRealmChar											=	tostring("Profiles."..tostring(CharacterRealm).."."..tostring(CharacterName).."");
		local SelectedProfile											= 	tostring(ZerkinzCfgChar["ActiveProfile"]);
		local AccountProfile 											= 	getfield("ZerkinzCfgAcct."..ProfilesRealmChar) or {};
		local CharacterProfile 											= 	getfield("ZerkinzCfgChar."..ProfilesRealmChar) or {};
		

		--[[ Deprecated Unique Global Array Profile Structure ]]--
		--ZerkinzCfgAcct["Profiles"]									= 	ZerkinzCfgAcct["Profiles"] or {};
		--ZerkinzCfgAcct["Profiles"][CharacterRealm]					=	ZerkinzCfgAcct["Profiles"][CharacterRealm] or {};
		--ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName] or {};
		setval("ZerkinzCfgAcct."..ProfilesRealmChar,					AccountProfile);

		--ZerkinzCfgChar["Profiles"]									= 	ZerkinzCfgChar["Profiles"] or {};
		--ZerkinzCfgChar["Profiles"][CharacterRealm]					=	ZerkinzCfgChar["Profiles"][CharacterRealm] or {};
		--ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName] or {};
		setval("ZerkinzCfgChar."..ProfilesRealmChar,					CharacterProfile);

		--[[ Object-Oriented Profiles Structure ]]--
		
		
		setval("ZerkinzConfig."..ProfilesRealmChar,					CharacterProfile);
		setval("ZerkinzConfig.Profiles.Account",						AccountProfile);
		setval("ZerkinzConfig.Profiles.Character",					CharacterProfile);
		--setval("ZerkinzConfig.Profiles."..CharacterRealm.."."..CharacterName, )
		--ZerkinzConfig["Profiles"]["Account"]						= 	AccountProfile;
		--ZerkinzConfig["Profiles"]["Character"]						= 	CharacterProfile; --ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName] or {};


		if	type( rawget(ZerkinzConfig.Profiles, SelectedProfile) ) == 'table' then
			rawset(ZerkinzConfig.Profiles, "Active", rawget(ZerkinzConfig.Profiles, SelectedProfile) or "Character");
			--ZerkinzConfig["Profiles"]["Active"]["loginCount"]			= 	ZerkinzCfgChar.loginCount or 0;
			--ZerkinzConfig.loginCount									=	ZerkinzCfgChar.loginCount or 0;
		else
			rawset(ZerkinzConfig.Profiles, "Active", rawget(ZerkinzConfig.Profiles, SelectedProfile) or "Character");
			--ZerkinzConfig["Profiles"]["Active"]							=	ZerkinzConfig["Profiles"]["Character"];
			--ZerkinzConfig["Profiles"]["Active"]["loginCount"]			= 	ZerkinzCfgChar.loginCount or 0;
			--ZerkinzConfig.loginCount									=	ZerkinzCfgChar.loginCount or 0;
		end

		--ZerkinzConfig["Profiles"]["Character"]						= 	ZerkinzConfig["Profiles"]["Character"] or {};
		--ZerkinzConfig["Profiles"][CharacterRealm]					=	ZerkinzCfgAcct["Profiles"][CharacterRealm] or {};
		--ZerkinzConfig["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName] or {};

		local CharacterProfile	= ZerkinzConfig["Profiles"]["Character"];
		local AccountProfile	= ZerkinzConfig["Profiles"]["Account"];
		local ActiveProfile		= ZerkinzConfig["Profiles"]["Active"];


		--[[	Backup Currently Set CVars if never logged in before! ]]--

		if tonumber(ZerkinzCfgAcct.loginCount) <= 1 and tonumber(ZerkinzCfgChar.loginCount) <= 1 then
			
			self.Actions:BackupProfile("All");

		else	

			if	tonumber(ZerkinzCfgAcct.loginCount) <= 1 --[[and tonumber(_G.ZerkinzCfgChar.loginCount) > 1]] then
		
				self.Actions:BackupProfile("All", "Account");
		
			end

			if	tonumber(ZerkinzCfgChar.loginCount) <= 1 --[[and tonumber(_G.ZerkinzCfgAcct.loginCount) > 1]] then
		
				self.Actions:BackupProfile("All", "Character");
		
			end
	
			if	not ZerkinzConfig.Profiles.Active.loginCount or tonumber(ZerkinzConfig.Profiles.Active.loginCount) <= 1 --[[and tonumber(_G.ZerkinzCfgAcct.loginCount) > 1]] then
		
				self.Actions:BackupProfile("All", "Character");
		
			end

		end


		if	type(ZerkinzConfig.Profiles.Active) == 'table' then
				return true;
		else
				return false;
		end


	end -- end initProfiles()


	--ZerkinzConfig.Frames = ( type(ZerkinzConfig.Frames) == 'table' and ZerkinzConfig.Frames ) or {};
	--ZerkinzConfig.Frames.Events = ( type(ZerkinzConfig.Frames.Events) == 'table' and ZerkinzConfig.Frames.Events ) or {};
	
	function ZerkinzConfig:OnEvent_Manager(event, value, ...)

		--ZerkinzConfig:Print("General", "OnEvent( "..(self and tostring(self:GetName()))..", "..tostring(event).." = "..tostring(value).."; );" );

		local self = self or _G[AddOnName];

		local eventName, eventFunction = stringMatch(event, _G[AddOnName]["EventFunctions"], "k"), stringMatch(event, _G[AddOnName]["EventFunctions"], "v"); -- 	or	( type( _G[AddOnName]["EventFunctions"][event] ) == ( "function" or "table" ) and _G[AddOnName]["EventFunctions"][event] ) or nil;

		if	( ( eventFunction ) --[[ and ( value ~= (nil or false or 'false') ) ]] ) then
			
			--ZerkinzConfig:Print("General", "|cff66FF11OnEvent( "..tostring(eventName).." = "..tostring(value).." );|r" );
			ZerkinzConfig:Print("ZerkinzConsole", "|cff66FF11OnEvent( "..tostring(eventName).." = "..tostring(value).." );|r" );
			--print("|cff66FF11OnEvent( "..(self and tostring(self:GetName()))..", "..tostring(eventName).." = "..tostring(value).."; );|r");
			return eventFunction(eventName or event, value, ...);
			--return _G[AddOnName]["EventFunctions"][eventName](event or eventName, value, ...);
		elseif (eventName or event)	then
			ZerkinzConfig:Print("ZerkinzConsole", "|cff66FF11OnEvent( "..tostring(eventName).." = "..tostring(value).." ) :: "..ColorText('FF0000', 'No EventFunction Found')..';' );
		else
			return false;
		end

	end



	function	ZerkinzConfig.Initialize:EventsFrame(...)
	
		local self = _G[AddOnName];
		
		if	not self.EventLogLoaded and self.EventLogLoaded ~= true then
			
			--[[ 	CREATE FRAME/WINDOW INTO THE EVENTS LOG --]]
			--[[ 	SPECIFIC EVENTS YOU WISH TO TRACK FOR USE AS TRIGGERS FOR REACTIVELY EXECUTING CODE .. ]]--
			--[[ 	MUST BE INDIVIDUALLY REGISTERED ON THE FRAME YOU WISH TO USE, .. ]]--
			--[[ 	AS MUST THE REACTIVE FUNCTION BE BOUND TO SAID FRAME ]]--
			

		--[[>>	Instantiate Core Event Arrays	>>]]
				
				ZerkinzConfig['EventFrames']			= CreateFrame("Frame", ZerkinzConfig['EventFrames'])

				_G[AddOnName]["Frames"]					= _G[AddOnName]["Frames"] or {};
				_G[AddOnName]["Frames"]["Events"]		=  CreateFrame('Frame', ZerkinzConfig.Frames.Events);

				_G[AddOnName]["Events"] 				= _G[AddOnName]["Events"] or {};
				--_G[AddOnName]["Events"]["Frame"]		=  CreateFrame('Frame', ZerkinzConfig.Frames.Events);

				_G[AddOnName]["EventFunctions"]			= _G[AddOnName]["EventFunctions"] or {};
				_G[AddOnName]["Events"]["States"]		= _G[AddOnName]["Events"]["States"] or {};
				_G[AddOnName]["Events"]["Redirects"]	= _G[AddOnName]["Events"]["Redirects"] or {};
				
				--_G[AddOnName]["Frames"]					=	_GreateFrame('Frame', ZerkinzConfig.Frames.Primary);
				_G["ZerkinzEventFrame"] 				= CreateFrame('Frame', 'ZerkinzEventFrame');

				_G[AddOnName]["EventLog"]				= _G[AddOnName]["Frames"]["Events"];	--CreateFrame('Frame', _G[AddOnName]["Frames"]["Events"]);	--, 'ZerkinzEventFrame', _G[AddOnName]["EventLog"]);
				_G[AddOnName]["EventFrame"]				= _G[AddOnName]["Frames"]["Events"];


				--self.PopUpEvents["COMMENTATOR_ENTER_WORLD"] = "1";
				--self.PopUpEvents["SYSMSG"] = "1";
				--self.PopUpEvents["CHAT_MSG_CHANNEL"] = "1";

				--_G[AddOnName].PopUpEvents = self.PopUpEvents;



			-- trigger event with /reloadui or /rl
			--self.Methods:EventHandler(_G[AddOnName] .. ".Frames.Events', "Register", "OnEnable");

			local eventsFrame = _G[AddOnName]["Frames"]["Events"];
			
			-- Set Events for which there exists unactivated functions to unregistered in my own event_env
			for k,v in pairs(self.EventFunctions) do
				if	type(v) == "function" then
					self.Methods:EventHandler(ZerkinzConfig.Frames.Events, "Unregister", k);
				end
			end
			

			self.Methods:EventHandler(self.Frames.Events, "Register", "ADDON_LOADED");
			self.Methods:EventHandler(self.Frames.Events, "Register", "PLAYER_LOGIN");
			self.Methods:EventHandler(self.Frames.Events, "Register", "PLAYER_LOGOUT");
			self.Methods:EventHandler(self.Frames.Events, "Register", "PLAYER_ENTERING_WORLD");
			self.Methods:EventHandler(self.Frames.Events, "Register", "PLAYER_LEAVING_WORLD");
			self.Methods:EventHandler(self.Frames.Events, "Register", "CVAR_UPDATE");
			self.Methods:EventHandler(self.Frames.Events, "Register", "CONSOLE_MESSAGE");
			
			self.Methods:EventHandler(self.Frames.Events, "Register", "SPELLS_CHANGED");
			--self.Methods:EventHandler(self.Frames.Events, "Register", "PLAYER_STARTED_MOVING");
			
			-- [[>>	Instantiate PopUpEvents Array	>>]] --
			
			rawset(self, 'PopUpEvents', {});

			self.PopUpEvents["SPELLS_CHANGED"] = "1";
			--//self.PopUpEvents["GLOBAL_MOUSE_DOWN"] = "1";
			--//self.PopUpEvents["PLAYER_STARTED_TURNING"] = "1";
			--//self.PopUpEvents["PLAYER_STARTED_MOVING"] = "1";
			--//self.PopUpEvents["WORLD_CURSOR_TOOLTIP_UPDATE"] = "1";
			--//self.PopUpEvents["CHAT_MSG_SYSTEM"] = "1";
			--self.PopUpEvents["CURSOR_UPDATE"] = "1";

			--self.PopUpEvents['__name'] = nil;
			--self.PopUpEvents['__parent'] = nil;

			--[[>>	Copy PopUpEvents to new ["Events"]["States"] array	>>]]
		
			--for k,v in pairs(self.PopUpEvents) do
			--	self["Events"]["States"][k] = v;
				--self["Events"]["States"][k] = v;
			--end

	--[[>>	Copy PopUpEvents to new EventRedirects array	>>]]
			--for k,v in pairs(self.PopUpEvents) do
			--	self["Events"]["Redirects"][k] = "SPELLS_CHANGED"; 	--"PLAYER_STARTED_MOVING";
			--end

			self.Methods:EventHandler(self.Frames.Events, "Register",  self.PopUpEvents);
		
			--ZerkinzEventFrame:SetScript("OnEvent", function(self, event, ...) local this = self; self = _G[AddOnName]; ZerkinzConfig.EventFunctions[event](self, event, ...) end )		

			--self = _G[AddOnName];

			--local OnEvent_Manager = self.OnEvent_Manager


			self["Frames"]["Events"]:SetScript("OnEvent", function(frame, event, value, ...) 
				
				self = self or _G[AddOnName];

				_G[AddOnName]:Print('General', self, frame, event, value, ( ( ... and select("#", ...) and tostring(...) ) or ( type(arg) == 'table' and #arg > 0 and table.concat(arg) ) ) );
				_G[AddOnName]:OnEvent_Manager(event, value, ...)

				local eventFunction = stringMatch(event, _G[AddOnName]['EventFunctions'], 'v') or _G[AddOnName]['EventFunctions'][event] or nil;

				if 	type(eventFunction) == 'function' then
					eventFunction_return = eventFunction(event, value, ...);
					ZerkinzConfig:Print("General", eventFunction_return);
				end

			end);  
			
			--[[
			function(event, value, ...)
				local self = _G[AddOnName]; 
				return self:OnEvent_Manager(event, value, ...); 
			end); 
			]]

			--[=[
			self["Frames"]["Events"]:SetScript("OnEvent", function(event, ...)
				

				--ZerkinzConfig:Print("General", "self = ", self, (self and self:GetName()));
				local __self = self;
				self = _G[AddOnName];
				self.args_t = arg or {...};
				--local event = (arg and select(1, arg)) or (... and select(1, {...})) or 'no event supplied';

				local arg1, arg2, arg3, arg4 = ...;

				local argLabels

				if not event then

					argLabels = { 'event', 'arg1', 'arg2', 'arg3', 'arg4' };
					for i,v in ipairs({...}) do

						local varName = (select(i, argLabbels));
						self[varName] = v;

					end

					event	= self.event;
					arg1	= self.arg1;
					arg2	= self.arg2;
					arg3	= self.arg3;
					arg4	= self.arg4;

				end

				self:Print("General", 'event = ', event, '; args >> ', arg1, arg2, arg3, arg4, "__self = ", __self, (__self and __self:GetName()));


				self.__temp = self.__temp or {};
				--self.__temp['dots_string'] = tostring(...);
				self.__temp['arg_string'] = ... and tostring(...);
				self.__temp['event_triggered'] = event or nil;
				self.__temp['event_payload'] = ... and { ... } or type(arg) == 'table' and arg or nil;
				self.__temp['event_payload_string'] =  self.__temp['arg_string'];--table_tostring(self.__temp['event_payload']);
				--self.__temp['event_payload_string'] = ( (...) or ... ~= nil and (( type(arg) == 'table' and ( (table.getn(arg or {...}) > 0) or  (n and n > 0) ) ) or ( type(...) == 'table' and tostring(select(1, ...)) ) or ( type({...}) == 'table' and #({...}) > 0 and select(1, {...}) ) ) );

				self['event_triggered'] = event;
				self['args'] = ...;

				local AddOn = _G[AddOnName];
				local args_count = ( (... and select("#", ...)) or #{...} or 0 );
				local args = ... and tostring(...) or nil;
				local args_t = arg or (args_count and{ ... }) or nil;
				local eventParameters = ... and tostring(...);
				--_G[AddOnName].Functions:ExploreTable(args);
				
				--local debug_message = "OnEvent( []: "..(args and tostring(args)).." );";
				--debug_message = table_tostring( {...} ); 

				--_G[AddOnName]:Print("ZerkinzConsole", "OnEvent( " .. ( (this and tostring(this:GetName())) or (self and self:GetName()) ) .. ", " .. tostring(event) .. ", " .. tostring(eventParameters) .. " );");
				_G[AddOnName]:Print( "General", "OnEvent( ", event, "[", args_count, "]: ", args, " );" );
				_G[AddOnName]:Print( "ZerkinzConsole", "OnEvent( ", event, "[", args_count, "]: ", args, " );" ); ---select(1, table_tostring({...})) ); 
				_G[AddOnName]:Print( "General", (type(self.__temp['event_payload_string']) == 'table' and self.__temp['event_payload_string'][1]) or self.__temp['event_payload_string'] );
				--_G[AddOnName]:ConsolePrint( "OnEvent( ", event, "[", select("#", ... or ''), "]: ", args, " );" );
				--for k,v in pairs(args) do _G[AddOnName]:Print("General", "OnEvent( ", k, " = ", v, " );"); end 
				
				local eventMatch;

				--if type(_G[AddOnName]["PopUpEvents"]) == "table" then
				--end

				if	event and type(_G[AddOnName]["Events"]["States"]) == "table" and type(_G[AddOnName]["EventFunctions"]) == "table" and type(_G[AddOnName]["EventFunctions"][event]) == "function" then
			
					local eventFunction		= stringMatch(event, _G[AddOnName]["EventFunctions"]);
					local eventFunctionType = type(_G[AddOnName]["EventFunctions"][event]);
					local eventRedirect		= stringMatch(event, _G[AddOnName]["Events"]["Redirects"], "v") or nil;
					local eventRedirectType = type(_G[AddOnName]["EventFunctions"][eventRedirect]) or nil;
					
					eventMatch = eventRedirect or eventFunction or false;

					_G[AddOnName]:Print("ZerkinzConsole", "|cff66FF11OnEvent('DEBUG_MSG'): ", (self and self:GetName()), eventFunction, eventFunctionType, eventRedirect, eventRedirectType);

			--[[>>	Decide Which EventFunction to Call() upon, check if Redirect exists	>>]]

					if	self["Events"]["States"][event] == "1"  then
						
						if	eventRedirectType == "function"  then

							self["EventFunctions"][eventRedirect](self, event, select(1, ...) );

						elseif	eventFunctionType == "function"  then

							self["EventFunctions"][event](self, event, unpack({...}) );

						end


					else

						self["Events"]["States"][event] = "0";
						self:Print("General", "|cffDD0000UnregisteredEvent[|r", event, "|cffDD0000] triggered!|r >> |cffDD0000UnRegistering|r >>");

						self["Frames"]["Events"]:UnregisterEvent(eventMatch);
						--self["Frames"]["Events"]:SetScript(eventMatch, nil);

						--[[

						if	type(self["PopUpEvents"]) == "table" then 

							eventMatch = stringMatch(tostring(event), self["PopUpEvents"]);
		
						end


						if	eventMatch and self["PopUpEvents"][eventMatch] == "0" then

							self["Frames"]["Events"]:UnregisterEvent(eventMatch);
							self["Frames"]["Events"]:SetScript(event, nil);
						
						else
							
							self["EventFunctions"][event](self, event, ...);
							ZerkinzConfig:Print("General", "|cffFFFF00RegisteredEvent = " .. tostring(event));

						end


					else

						ZerkinzConfig:Print("General", "|cffCC0000UnregisteredEvent = [", event, "], yet triggering!!!");

						]]
						
					end
					
				end
				
			end);
			]=]
		end

		_G['ZerkinzEventFrame'] = self["Frames"]["Events"]; 
		self.EventLogLoaded = true;

	end		


	--SetScript("OnEvent", function(self, event, ...) if event and type(_G[AddOnName]["EventFunctions"][event]) == "table" then _G[AddOnName]["EventFunctions"][event](self, ...) end );		
	--_G[AddOnName]["EventFrame"] = _G[AddOnName]["Frames"]["Events"];
	--local ZerkinzConfigEvents = _G["ZerkinzConfigEvents"];
	--ZerkinzEventFrame:SetScript("OnEvent", function(this, event, ...) ZerkinzConfigEvents[event](ZerkinzConfigEvents, ...) end )		


function ZerkinzConfig.Initialize:Chat_GetFramesInfo(t, ...)
		
		local self = (self and self == _G[AddOnName]) or _G[AddOnName];
		
		ZerkinzConfig.ChatWindowsIndex = ZerkinzConfig.ChatWindowsIndex or {};
		ZerkinzConfig['ChatWindows'] = ZerkinzConfig['ChatWindows'] or {};

		local mt_ChatWindows = getmetatable(rawget(ZerkinzConfig, 'ChatWindows')) or {};
		function	mt_ChatWindows:__call(self) 
			ZerkinzConfig:Print( "General", tostring(table.concat(chatWindow)) );
			return self.object or _G['ChatFrame'..tostring(self.index)] or Chat_GetChatFrame(self.index) or false; 
		end
		
		local chatWindow;

		--ApplyChatTypeSettings();

		--ACTIVE_CHAT_WINDOWS = #CHAT_FRAMES or CountChatWindows() or 0;

		local _i = 0;
		local i = 1;

		--for i = 1, (ACTIVE_CHAT_WINDOWS--[[ or NUM_CHAT_WINDOWS ]]) do
		
		for k,v in ipairs(CHAT_FRAMES) do

			--[[if	i == _i then
				i = i + 1;
			end]]

			i = tonumber(k); 

			chatWindow = {};
			chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.index, chatWindow.uninteractable	= GetChatWindowInfo(i);
			chatWindow.index = k or chatWindow.docked or i;
		
			if	not chatWindow.name  then
				break;
			else--if not ZerkinzConfig['ChatWindows'][chatWindow.name] then

				chatWindow.frameName	= ( ( chatWindow.index or k )  and  ( 'ChatFrame'..tostring(chatWindow.index or k) ) );
				--chatWindow.object = _G[chatWindow.frameName];

				if	chatWindow.object then
					--ZerkinzConfig.ChatWindowsIndex[(chatWindow.index or k)] = chatWindow;
					--ChatWindows[(chatWindow.index or i)] = chatWindow;

					local		mt = {};
					function	mt:__call(self) 
						ZerkinzConfig:Print( "General", tostring(table.concat(chatWindow)) );
						--return self.object or _G['ChatFrame'..tostring(k)] or self.Chat_GetChatFrame(k or chatWindow.index or i) or false; 
						return self.object or _G['ChatFrame'..tostring(self.index)] or Chat_GetChatFrame(self.index) or false; 
					end
								mt[chatWindow.name] = mt:__call(self);

					--[[
					for k,v in pairs(mt) do
					
								mt_ChatWindows[k] = v;

					end
					]]		

					--local function Chat_ReturnChatFrame() return self.Chat_GetChatFrame(k or chatWindow.index or i) or false; end
					ZerkinzConfig['ChatWindows'][chatWindow.name] = setmetatable(chatWindow, mt);-- or  Chat_ReturnChatFrame; --function() return Chat_GetChatFrame(chatWindow.index or i); end --chatWindow.object;

				end

			end

			--_i = i;

		end

		--ZerkinzConfig.ChatWindowsIndex
		--ZerkinzConfig.ChatWindowsInfo = ChatWindows;

		return true;

	end



	function	ZerkinzConfig.Initialize:ConsoleCommands(...)
	
		--self.Methods:EventHandler(ZerkinzConfig.Frames.Events, "Register", "ADDON_LOADED");
		local self = _G[AddOnName];


		self:RegisterChatCommand("ZerkinzConfig", "Console");
		self:RegisterChatCommand("ZERKINZCONFIG", "Console");
		self:RegisterChatCommand("zerkinzconfig", "Console");
		self:RegisterChatCommand("ZC", "Console");
		self:RegisterChatCommand("zc", "Console");
		self:RegisterChatCommand("ZCFG", "Console");
		self:RegisterChatCommand("zcfg", "Console");
		self:RegisterChatCommand("ZCfg", "Console");

		return true;
	
	end

	-- /ZerkinzConfig 1 2 3
	function ZerkinzConfig:Console( args, value, ... )
		
		--self:GarbageCollect("true");
		--local dots = select(1,...);
		local self = self or _G[AddOnName];
		self.__temp = is_table(self.__temp) or {};
		self.__temp. args_string = tostring(args);
		local arg_fragments = string.explode(args, ' ')

		ZerkinzConfig:Print('General', 'args = '..tostring(args)..';');		
		
		local dots = (  ( is_number(select("#", ...)) and tonumber(select("#", ...)) > 0 ) and ( is_table( { ... } ) or is_table( {unpack(...)} ) )  ) or nil;
		local t_tostring = is_table(dots) and table_tostring(dots, 240, 'table');
		
		if 	is_table(value) and is_table(t_tostring)	then

			ZerkinzConfig:Print('General', table_tostring(is_table(value) or {}), 225);
			for k,v in pairs(t_tostring) do
				ZerkinzConfig:Print('General', 'Dots ['..tostring(k)..'] = '..tostring(v));
			end

			if value and #value > 0 then

				for k,v in pairs(value) do
					print('args[', k, '] == ', v, ";");
					if type(v) == 'table' then
						for key,val in pairs({value}) do
							print('--dots[', key, '] == ', val, ";");
						end
					end
				end

			end
		--local _ENV = {};
		end

		local calledMethod = self;
		local self = _G[AddOnName];
		local arg1, arg2, arg3, arg4, arg5, arg6;

		if	not self.Modules or not self.Actions then
			self:InstantiateCoreArrays();	
		end		

		local	__args = {};
				__args[AddOne('__i')], __args[AddOne('__i')], __args[AddOne('__i')], __args[AddOne('__i')], __args[AddOne('__i')], __args[AddOne('__i')] = self:GetArgs(args, 6);	
	
				self.__args = __args;
	
				arg1, arg2, arg3, arg4, arg5, arg6 = self:GetArgs(args, 6);			

		for k,v in pairs(__args) do
			print(k, ' == ', v);
		end

		self.__args = __args;

		local	actionName, moduleName, parameter1, parameter2, parameter3, parameter4 = self:GetArgs(args, 6);

		ZerkinzConfig:Print("Console() self = ", (calledMethod and calledMethod:GetName()), self:GetName(), args, (type(value)==('table' or 'userdata') and value));
		ZerkinzConfig:Print('actionName, moduleName = ', actionName, moduleName, parameter1, parameter2);

		if	actionName then
	
			self.actionName = actionName;
			self.moduleName = moduleName;
			self.parameter1 = parameter1;
			self.parameter2 = parameter2;
			self.parameter3 = parameter3;
			self.parameter4 = parameter4;

		else
			
			
			if arg1 then
				
				actionName = arg1;
				moduleName = arg2; 
				parameter1 = arg3;
				parameter2 = arg4;
				parameter3 = arg5;
				parameter4 = arg6;

			end

		end
		


		--[[
		
		for k,v in pairs({...}) do
		
			self:Print('General', k, ' == ', v);
			
		end					

		--		if not actionName or moduleName then 
		print(actionName, moduleName, parameter1, parameter2, parameter3);
		print(...);
		print(select(1, ...));
		
		

		ZerkinzConfig:Print("General", 'Actions >>');
		ZerkinzConfig:ConsolePrint('Actions >>');
		]]
	
		--[[
		for k,v in pairs(self.Actions) do
			ZerkinzConfig:Print("General", k, ' => ', v);
			ZerkinzConfig:ConsolePrint(k, ' => ', v);
		end
		
		ZerkinzConfig:Print("General", 'Modules >>');
		ZerkinzConfig:ConsolePrint('Modules >>');
	
		for k,v in pairs(self.Modules) do
			ZerkinzConfig:Print("General", k, ' => ', v);
			ZerkinzConfig:ConsolePrint(k, ' => ', v);
		end		
		]]

		local	actionMatch 		= keyExists(actionName, self.Actions) or keyMatch(actionName, self.Actions) or false;
				self.actionMatch 	= actionMatch or false;
		local	moduleMatch 		= keyExists(moduleName, self.Modules)  or keyMatch(moduleName, self.Modules) or false;-- or ( keyExists(actionMatch, self.NoModuleActions) and moduleName );		
				self.moduleMatch 	= moduleMatch or false;
		
			if 	moduleMatch then 
				ZerkinzConfig:Print("General", "Instantiating values for " .. tostring(moduleMatch));
				self:InstantiateModule(moduleMatch);		
			end		

		--local	argsRequired 		= ( actionMatch and keyExists(actionMatch, self.ActionParameters) ) and tonumber(self.ActionParameters[actionMatch]);
		--		self.argsRequired	= argsRequired or nil;

		local 	actionObject = self["Actions"][actionMatch];

		--ZerkinzConfig:Print("General", '::|cffFFFF33 PRE-CALLING : '..tostring(actionObject or 'no actionObject found')..", "..tostring(actionMatch), type(actionObject), actionMatch, moduleMatch, '\n//Args: ', actionName, moduleName, parameter1, parameter2);
		ZerkinzConfig:Print("General", tostring(actionName)..", "..tostring(actionMatch)..", ", tostring(actionObject));
		
		--ZerkinzConfig:Print("General", '::|cffFFFF33 PRE-CALLING : '..tostring(actionObject or 'no actionObject found')..", "..tostring(actionMatch), type(actionObject), actionMatch, moduleMatch, '\n//Args: ', actionName, moduleName, parameter1, parameter2);
		---ZerkinzConfig:Print("General", tostring(actionName)..", "..tostring(actionMatch)..", ", tostring(actionObject));

		
		print(actionObject, type(actionObject));

		if	( actionObject )  then -- and  ( ( tonumber(self.args_count) >= tonumber(self.argsRequired or 4) ) or ( self.args[self.args_count or 0] ) or ( actionMatch and moduleMatch ) ) then

			ZerkinzConfig:Print("General", '::|cffFFFF33 CALLING : '..tostring(actionObject or 'no actionObject found')..", "..tostring(actionMatch), type(actionObject), actionMatch, moduleMatch, '\n//Args: ', actionName, moduleName, parameter1, parameter2);
			--ZerkinzConfig:Print("General", '::|cff66FF11 CALLING : ', tostring(actionObject), type(actionObject), actionMatch, moduleMatch, ' // ', actionName, moduleName, parameter1, parameter2, '\n', ZerkinzConfig:Print("General", tostring(actionMatch), tostring(actionMatch)), '\n');
	
			moduleMatch = moduleMatch or moduleName;
	--		ZerkinzConfig:Print("General", '::|cff66FF11 CALLING : ', actionName, moduleName, parameter1, parameter2, '\n\n');
			actionObject(self, arg2, arg3, arg4, arg5, arg6); --unpack(__args));
			--actionObject(self, moduleMatch, parameter1, parameter2, parameter3);
			return true;
	
		else

			return false;

		end 

		--actionObject(moduleMatch, parameter1, parameter2);
		
		--[=[
		
		if	not self.Actions or not self.Modules then
			self:InstantiateCoreArrays();
			--self:InstantiateModule();
		end

		local actionMatch = stringMatch(actionName, self.Actions);
		local moduleMatch = stringMatch(moduleName, self.Modules);

		self.actionMatch	= actionMatch or nil;
		self.moduleMatch	= moduleMatch or nil;
	
		local actionObject = nil;
	
		if	actionMatch then
			self.actionMatch	= actionMatch; 		
			actionObject		= self["Actions"][actionMatch];
		else
			actionObject		= nil;
			self.actionMatch	= nil;
		end
		
		--DEBUG: ZerkinzConfig:Print("General", "actionMatch, moduleMatch =>", tostring(actionMatch), type(actionMatch), tostring(moduleMatch), type(moduleMatch));
	
		--self:AcceptPopUp("Accept", "Disable");
		--self:AcceptPopUp("Accept");
		--self:AcceptPopUp();
		
		if not actionName or not actionMatch then
			
			ZerkinzConfig:Print("General", "Welcome to ZerkinzUI Config! Type /ZerkinzConfig or /zcfg to access its text interface. Here are the available actions to you (accessed via /ZerkinzConfig $action $module)");
			
			self:printTableKeys(self.Actions, "k");
	
			for k,v in pairs(self.Actions) do
			
				ZerkinzConfig:Print("General", k);
			
			end
		
			--printArray(self.Actions);	
		
			return false;	
		
		--[[elseif	actionMatch and moduleMatch then
		
			ZerkinzConfig:Print("General", "Attempting to dynamically call: ZerkinzConfig:" .. actionMatch .. "('" .. moduleMatch .. "') ");
			
			for k,v in pairs(self) do
			
				print(tostring(k), tostring(v)); 
			
			end
			print("\n\n");
			
			for k,v in pairs(ZerkinzConfig) do
			
				print(tostring(k), tostring(v)); 
			
			end		
		
			ApprovedRequest = ZerkinzConfig[actionMatch]("" .. moduleMatch .. "");
			print(tostring(ApprovedRequest), type(ApprovedRequest))
		
			if ApprovedRequest then
				ZerkinzConfig:Print("General", "ZerkinzConfig:" .. actionMatch .. "(" .. moduleMatch .. ") finished successfully!");
			else
				ZerkinzConfig:Print("General", "ZerkinzConfig:" .. actionMatch .. "(" .. moduleMatch .. " encountered a problem while executing, sorry.)");
			end
			]]
		
		elseif self.Actions[actionMatch] and self.Modules[moduleMatch] then
			
		ZerkinzConfig:Print("General", "Instantiating values for " .. tostring(moduleMatch));
		self:InstantiateModule(moduleMatch);
		
		ZerkinzConfig:Print("General", "|cffFF9900[actionMatch] = " .. tostring(actionMatch) .. ";");
		ZerkinzConfig:Print("General", "|cffFF9900[actionObject] = " .. tostring(actionObject) .. ";");
		
			if	type(actionObject) == "function" then
				
			
				--self["Called"] = {};
				--self["Called"]["Action"] = actionObject;			
				--self["Called"]["Module"] = moduleMatch;
				self.CalledObject = _G["AddOnName"];
				self.CalledAction = actionMatch;
				self.CalledModule = moduleMatch;
				self.CalledParameter = parameter1;
				self.CalledString = tostring(_G["AddOnName"]) .. ":" .. tostring(actionMatch) .. ":" .. tostring(moduleMatch) .. "(" .. tostring(args) ..  ");";
				
				if type(self.CalledString) == "string" then 
					
					ZerkinzConfig:Print("General", self.CalledString);
				
				end
			
				ZerkinzConfig:Print("General", "|cff66FF11Calling " .. tostring(actionMatch) .. "(" .. tostring(self) .. ", " .. tostring(_G["AddOnName"]) .. ", " .. tostring(moduleMatch) .. ");|r");
				actionObject(_G[AddOnName], "" .. tostring(moduleMatch) .. "", args)
			
			elseif actionMatch then
				
				ZerkinzConfig:Print("General", "|cffFFFF00Calling: " .. tostring(actionMatch) .. "(" .. tostring(moduleMatch) .. ");|r");
				actionObject = self[actionMatch];
				actionObject(self, moduleMatch, args)
			
			end
			
		
			self:GarbageCollect();
			self:AcceptPopUp("Accept", "Disable");
		
			return true;

		end

		if not actionMatch then return false; end

		self = _G[AddOnName];
		self.args_string = tostring(select(1, ...));
		self.args = string.explode(tostring(select(1, ...)), ' ') or { ... };
		self.args_count = ( (type(self.args) == 'table') and tonumber(#(self.args)) ) or nil;
		
		self.parameterNames = { [1] = 'actionName', [2] = 'moduleName', [3] = 'parameter1', [4] = 'parameter2', [5] = 'parameter3', [6] = 'parameter4', [7] = 'parameter5', [8] = 'parameter6', [9] = 'parameter7', [10] = 'paramter8' };
		
		local function GetArgNames(args, parameters)

			local labeled_args;
			local labeled_args_mt;

			if	type(args) ~= 'table' or type(parameters) ~= 'table' then
				return false;
			else
		
				labeled_args = {};

				for k,v in pairs(args) do

					local key_t;
					local key_mt;

					--labeled_args = labeled_args or {};
					local activeParameter = ( (parameters[k] ~= (nil or false) and parameters[k]) or false );
					
					if	activeParameter then 

						key_t = { [activeParameter] = v };
						key_mt = {};				

						for key,val in pairs(key_t) do 
							key_mt['__name'] = tostring(key);
							key_mt['__key'] = tostring(key);
							key_mt['__value'] = val;
							key_mt['__tostring'] = function() local keyName = key or false; local keyVal = val or false; local str = (keyName and tostring(keyName))..' = '..(keyVal and tostring(keyVal)); return str or false; end 
							key_mt['GetName'] = function() local keyName = key or false; local keyVal = val or false; return keyName, keyVal; end
						end

						key_t = setmetatable(key_t, key_mt);
						labeled_args[k] = key_t;
					
					end

				end

				local final_t = {};

				for k,v in pairs(labeled_args) do

					local key = v.__key or v.__name;
					local val = v.__value

					if key and val then
						table.insert(final_t, key, val);
					end

				end

				return final_t or false, labeled_args or false;
				
			end

		end			

		self.commandLine_input	= tostring(select(1, ...)); 
		self.commandLine_array	= GetArgNames({...}, self.parameterNames);
		self.parameters 		= GetArgNames({...}, self.parameterNames);
		self.argArray 			= GetArgNames({...}, self.parameterNames) or self.commandLine_array;

		self.argLabels = {};
		self.argLabels[1] = 'actionName';
		self.argLabels[2] = 'moduleName';
		self.argLabels[3] = 'parameter1';
		self.argLabels[4] = 'parameter2';

		self.argsLabeled = {};
		self.namedArgs = {};


		for k,v in ipairs(self.args) do
			
			local thisLabel = self.argLabels[k] or false;
			
			if	( thisLabel  ~= false )	then

				self[thisLabel] = v;
				self.namedArgs[thisLabel] = v;
				self.argsLabeled[thisLabel] = v;
			
			else
				
				self[thisLabel] = nil;
				self.namedArgs[thisLabel] = nil;
				self.argsLabeled[thisLabel] = nil;				
				
			end

			print(k, ' => ', v);

		end

		
		--local actionName, moduleName, parameter1, parameter2;
		local actionName = self.args[1] or nil;
		local moduleName = self.args[2] or nil;
		local parameter1 = self.args[3] or nil;
		local parameter2 = self.args[4] or nil;
		local parameter3 = self.args[5] or nil;
		local parameter4 = self.args[6] or nil;
		local parameter5 = self.args[7] or nil;

		--local parameter2 = stringMatch(self.args[4] or nil, self.Actions);		
		self.actionName = actionName;
		self.moduleName = moduleName;
		self.parameter1 = parameter1;
		self.parameter2 = parameter2;
		self.parameter3 = self.args[5] or nil;
		self.parameter4 = self.args[6] or nil;
		self.parameter5 = self.args[7] or nil;



		if not self.CharacterName or not self.CharacterRealm then
		
			local CharacterRealm = GetRealmName();
			local CharacterName, Realm = UnitName("player");
		
			self.CharacterRealm	= CharacterRealm;
			self.CharacterName	= CharacterName;

			if CharacterName and CharacterRealm then

				self.CharacterName	= CharacterName;
				self.CharacterRealm	= CharacterRealm;

				ZerkinzCfgAcct["Profiles"]									=	ZerkinzCfgAcct["Profiles"] or {};
				ZerkinzCfgAcct["Profiles"][CharacterRealm]					=	ZerkinzCfgAcct["Profiles"][CharacterRealm] or {};
				ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName] or {};

				ZerkinzCfgChar["Profiles"]									=	ZerkinzCfgChar["Profiles"] or {};
				ZerkinzCfgChar["Profiles"][CharacterRealm]					=	ZerkinzCfgChar["Profiles"][CharacterRealm] or {};
				ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName] or {};		

			end		
		
		end
	
		ZerkinzConfig:Print("General", '|cffFFCC00 SlashCommand() args =>' .. tostring(args) .. ' and ' .. tostring(...));
		
		local	split_args = string.explode(tostring(select(1, ...)), ' ');

		local	argArray = {};
				argArray = self:GetArgs(tostring(select(1, ...)), 6);
		
				self.Functions:ExploreTable(split_args, 'split_args');
				ZerkinzConfig:Print("General", '\n-------------------------');
				self.Functions:ExploreTable(argArray, 'argArray');

				self.argArray = argArray;
				--self.args = args;
		--[[
		local actionName = argArray[1]
		local moduleName = argArray[2]
		local parameter1 = argArray[3]
		local parameter2 = argArray[4]
		]]
		--local args;
		--local params = {...};
		--local param1 = params[1] or tostring(params);
		--local argArray = {};
		--local argArray = self:GetArgs(tostring(params), 6);
		--self.argArray = {};

		if	type(argArray) == 'table' then

			for k,v in ipairs(argArray) do		
				self.argArray[k] = v;
			end
			argArray = self.argArray;
			
		end

		--self.argArray[1], self.argArray[2], self.argArray[3], self.argArray[4], self.argArray[5], self.argArray[6] = self:GetArgs(args, 6);
		
		if	not self.Actions or not self.Modules then
			self:InstantiateCoreArrays();
			--self:InstantiateModule();
		end

		local actionMatch = stringMatch(actionName, self.Actions);
		local moduleMatch = stringMatch(moduleName, self.Modules);

		self.actionMatch	= actionMatch or nil;
		self.moduleMatch	= moduleMatch or nil;
	
		local actionObject = nil;
	
		if	actionMatch then
			self.actionMatch	= actionMatch; 		
			actionObject		= self["Actions"][actionMatch];
		else
			actionObject		= nil;
			self.actionMatch	= nil;
		end
		
		--DEBUG: ZerkinzConfig:Print("General", "actionMatch, moduleMatch =>", tostring(actionMatch), type(actionMatch), tostring(moduleMatch), type(moduleMatch));
	
		--self:AcceptPopUp("Accept", "Disable");
		--self:AcceptPopUp("Accept");
		--self:AcceptPopUp();
		
		if not actionName or not actionMatch then
			
			ZerkinzConfig:Print("General", "Welcome to ZerkinzUI Config! Type /ZerkinzConfig or /zcfg to access its text interface. Here are the available actions to you (accessed via /ZerkinzConfig $action $module)");
			
			self:printTableKeys(self.Actions, "k");
	
			for k,v in pairs(self.Actions) do
			
				ZerkinzConfig:Print("General", k);
			
			end
		
			--printArray(self.Actions);	
		
			return false;	
		
		--[[elseif	actionMatch and moduleMatch then
		
			ZerkinzConfig:Print("General", "Attempting to dynamically call: ZerkinzConfig:" .. actionMatch .. "('" .. moduleMatch .. "') ");
			
			for k,v in pairs(self) do
			
				print(tostring(k), tostring(v)); 
			
			end
			print("\n\n");
			
			for k,v in pairs(ZerkinzConfig) do
			
				print(tostring(k), tostring(v)); 
			
			end		
		
			ApprovedRequest = ZerkinzConfig[actionMatch]("" .. moduleMatch .. "");
			print(tostring(ApprovedRequest), type(ApprovedRequest))
		
			if ApprovedRequest then
				ZerkinzConfig:Print("General", "ZerkinzConfig:" .. actionMatch .. "(" .. moduleMatch .. ") finished successfully!");
			else
				ZerkinzConfig:Print("General", "ZerkinzConfig:" .. actionMatch .. "(" .. moduleMatch .. " encountered a problem while executing, sorry.)");
			end
			]]
		
		elseif self.Actions[actionMatch] and self.Modules[moduleMatch] then
			
		ZerkinzConfig:Print("General", "Instantiating values for " .. tostring(moduleMatch));
		self:InstantiateModule(moduleMatch);
		
		ZerkinzConfig:Print("General", "|cffFF9900[actionMatch] = " .. tostring(actionMatch) .. ";");
		ZerkinzConfig:Print("General", "|cffFF9900[actionObject] = " .. tostring(actionObject) .. ";");
		
			if	type(actionObject) == "function" then
				
			
				--self["Called"] = {};
				--self["Called"]["Action"] = actionObject;			
				--self["Called"]["Module"] = moduleMatch;
				self.CalledObject = _G["AddOnName"];
				self.CalledAction = actionMatch;
				self.CalledModule = moduleMatch;
				self.CalledParameter = parameter1;
				self.CalledString = tostring(_G["AddOnName"]) .. ":" .. tostring(actionMatch) .. ":" .. tostring(moduleMatch) .. "(" .. tostring(args) ..  ");";
				
				if type(self.CalledString) == "string" then 
					
					ZerkinzConfig:Print("General", self.CalledString);
				
				end
			
				ZerkinzConfig:Print("General", "|cff66FF11Calling " .. tostring(actionMatch) .. "(" .. tostring(self) .. ", " .. tostring(_G["AddOnName"]) .. ", " .. tostring(moduleMatch) .. ");|r");
				actionObject(_G[AddOnName], "" .. tostring(moduleMatch) .. "", args, ...)
			
			elseif actionMatch then
				
				ZerkinzConfig:Print("General", "|cffFFFF00Calling: " .. tostring(actionMatch) .. "(" .. tostring(moduleMatch) .. ");|r");
				actionObject = self[actionMatch];
				actionObject(self, moduleMatch, args, ...)
			
			end
			
		
			self:GarbageCollect();
			self:AcceptPopUp("Accept", "Disable");
		
		end
		]=]
	
	end -- end ZerkinzConfig.Console()		
		


	function ZerkinzConfig:CreateChatWindow(frameName, ...)

		--local chatWindowsFrame = rawget(ZerkinzConfig, 'Frames') or nil;
		local chatWindowsIndex = rawget(ZerkinzConfig, 'ChatWindowsIndex') or nil;
		local chatWindowsTable = rawget(ZerkinzConfig, 'ChatWindows') or nil;
		--local chatWindowsFrame = rawget(ZerkinzConfig.Frames, 'Events') or nil;

		local consoleName = 'ZerkinzConsole';

		--local chatTypeInfo = { sticky = true, flashTab = true, flashTabOnGeneral = true, ignoreChatTypeProcessing = false };
		
		--ApplyChatTypeSettings('CONSOLE', chatTypeInfo);

		ZerkinzConfig['ChatWindowsIndex'] = (type(chatWindowsIndex) == 'table' and (chatWindowsIndex or rawget(ZerkinzConfig, 'ChatWindowsIndex'))) or {};
		ZerkinzConfig['ChatWindows'] = (type(chatWindowsTable) == 'table' and (chatWindowsTable or rawget(ZerkinzConfig, 'ChatWindows'))) or {};
		--ZerkinzConfig['Frames'] = (type(chatWindowsFrame) == 'table' and (chatWindowsFrame or ZerkinzConfig['Frames']['Events'])) or {};
		
		local frameName = (type(frameName)=="string" and frameName) or 'ZerkinzConsole'; --(type(frameName)=="string" and tostring(frameName)) or 'ZerkinzConsole';
		--local frameExists = rawget(ZerkinzConfig.Frames, 'Events') or nil;
		--local chatFrameExists = rawget(ZerkinzConfig.ChatWindows, frameName) or nil;
		local chatWindowExists = Chat_GetWindow(frameName) or Chat_WindowExists(frameName);
		local chatFrameExists = Chat_GetWindow(frameName) or chatWindowExists or nil;

		--local ConsoleFrameName	= "ZerkinzConsole";
		--local frameName = ConsoleFrameName or frameName;

		if	chatWindowExists or chatFrameExists then --ZerkinzConfig['ChatWindows'][frameName]  then
			return true;
		end		

		--_G[frameName] 	= _G[frameName];

		-- FUNCTION CALL... NOT DEFINITION.
		ZerkinzConfig.Initialize:Chat_GetFramesInfo(CHAT_FRAMES);
		
		local found;
		--local ConsoleFrameName = 'ZerkinzConsole';
		local chatFrameCount = #CHAT_FRAMES or CountChatWindows();
		local chatWindowsCount = #CHAT_FRAMES or CountChatWindows();
		local chatWindowName;
		local chatFrameIndex;
		local chatFrameName;
		local chatFrameObject;

		--[[
		--local ChatWindow_i = NUM_CHAT_WINDOWS + 1;

		for i = 1, NUM_CHAT_WINDOWS do

			local	__name			= GetChatWindowInfo(i);
			local 	__object 		= _G['ChatFrame'..tostring(i)];

			if	__name and __object	then 

				ZerkinzConfig.ChatWindows[__name] = __object; --_G['ChatFrame'..tostring(i)];

			end


						--ChatWindow_i	= i + 1;
						--chatFrameCount 	= chatFrameCount or (i);

			if	__name	==	ConsoleFrameName	then

				chatFrameName	= __name;
				chatFrameIndex	= i;
				chatFrameName	= tostring('ChatFrame'..chatFrameIndex);
				chatFrameObject	= _G[chatFrameName];
				found = i;
				
			end

		end	]]

		--if not ZerkinzConfig['Frames'][frameName] then	-- frameName not found

				--ZerkinzConfig['Frames'][frameName] = CreateFrame("Frame");
				--ZerkinzConfig['Frames']['["EventFunctions"]:SetScript("OnEvent", function(self, event, value, ...)
					
					--if event == "PLAYER_LOGIN" then 

						--SetCVar('brightness', 25);

						--ZerkinzConfig.Initialize:Chat_GetFramesInfo(CHAT_FRAMES);

						local _frameName = frameName;
						local frameName = frameName or 'ZerkinzConsole';
						
						ZerkinzConfig:Print("General", 'CreateChatWindow'..':( '..(frameName and tostring(frameName)) or 'no frameName'..', '..tostring(select(1, ...) or 'no selection')..' ); \narg = '..(arg and tostring(arg)) or 'arg was nil'..';');

						local chatFrame, chatFrameName, chatWindowName	= Chat_WindowExists(frameName);
						local chatWindowExists 							= (type(chatFrame) == 'table' and true) or false;
						local chatWindow								= Chat_GetWindowInfo(frameName);
						

						if	( type(chatFrame) == 'table' and chatFrame) or ( chatWindowExists and chatWindowExists ~= (nil or false) ) or ( type(chatWindow) == ('table' or 'userdata') and type(chatWindow.name) == 'string' and chatWindow.name == frameName )	then
				
							chatWindowName 			= chatWindowName or chatWindow.name;
							chatFrameIndex 			= chatWindow.index or found;
							chatFrameName 			= chatFrameName or chatWindow.frameName or (chatWindow.index and tostring('ChatFrame'..tostring(chatWindow.index)));
							chatFrameObject			= chatFrame or chatWindow.object or (chatFrameName and _G[chatFrameName]) or (chatWindow.frameName and _G[tostring(chatWindow.frameName)]);
				
							--ZerkinzConfig['ChatWindows']['ZerkinzConsole'] = GetChatFrame();
							--_G[frameName] = _G[frameName] or _G[chatWindow.frameName];
							--[[
							if 	not ZerkinzConfig.ChatWindows[chatWindow.name]  then
								ZerkinzConfig.ChatWindows[chatWindow.name or chatFrameName] = ZerkinzConfig.ChatWindows[chatWindow.object];-- or chatWindow.object; --chatFrameObject;
								ZerkinzConfig.ChatWindowsIndex[chatWindow.index] = chatWindow;
							end
							]]

						elseif 	not chatFrame then --and not ZerkinzConfig['ChatWindows'][frameName]  then
						
							local chatWindow = {};

							ZerkinzConfig['Frames'][frameName], chatFrameIndex = FCF_OpenNewWindow(frameName, true);

							chatWindow = Chat_GetWindowInfo(frameName);
							--chatWindow.name, chatWindow.fontSize, chatWindow.r, chatWindow.g, chatWindow.b, chatWindow.alpha, chatWindow.shown, chatWindow.locked, chatWindow.index, chatWindow.uninteractable	= GetChatWindowInfo(chatFrameIndex);
							
							if type(chatWindow) == 'table' then 
								return Chat_GetWindow(frameName), chatWindow; 
							end

							--[=[
							local chatWindowExists = GetChatWindow(frameName);
							chatWindow.frameName = 'ChatFrame'..tostring(chatFrameIndex);
							chatWindow.object = _G[chatWindow.frameName];
							
							if type(chatWindow.object) == 'table' and type(chatWindow.name) == 'string' then

								ZerkinzConfig['ChatWindows'][frameName] = chatWindow.object;
							else
								ZerkinzConfig.ChatWindowsIndex[(chatWindow.index and tostring(chatWindow.index))] = nil;
								_G[ZerkinzConfig.ChatWindows.frameName] = nil;
								ZerkinzConfig['ChatWindows'][frameName] = nil;
							end

							if not ZerkinzConfig['ChatWindowsIndex'][chatFrameIndex] then
		
								ZerkinzConfig['ChatWindowsIndex'][chatFrameIndex] = chatWindow;

							end
							--_G[frameName] = ZerkinzConfig['ChatWindows'][frameName] or _G['ChatFrame'..tostring(chatFrameIndex)]; --_G["ChatFrame"..((chatFrameIndex and tostring(chatFrameIndex)) or (NUM_CHAT_WINDOWS and tostring(NUM_CHAT_WINDOWS)))];
						
							--if 	type(_G[frameName]) == 'table' then
							--	_G[frameName]:AddMessage("Initializing: _G["..tostring(frameName).."] |cffFF0000"..tostring(frameName).."|r..", 1, 1, 1);
							--end
							for ChatWindowName,ChatWindowObject in pairs(ZerkinzConfig.ChatWindows) do
								
								ZerkinzConfig:Print(ChatWindowName, "|cffAAAAAA['|cffFF0000ZERKiNZ|r|cffFFFFFFCONFiG|r']:['|cffFFFFFFInitializing|r']('|cffFF0000"..tostring(ChatWindowName).."|r');");

							end

							--ZerkinzConfig['ChatWindows']['General']:AddMessage("|cff66FF11[[ OnEvent ]]:[[ "..tostring(event).." ]]:((  |cffFFFFFF[ |cffFF0000Zerkinz|r|cffFFFFFFConsole|r ]  ));|r", 1, 1, 1);	
							--ZerkinzConfig['ChatWindows'][_frameName]:AddMessage("|cffCCCCCC['|cffFF0000ZERKiNZ|r|cffFFFFFFCONFiG|r']:['|cffFFFFFFInitializing|r'] |cffFFFFFF[ |cffFF0000Zerkinz|r|cffFFFFFFConsole|r ];|r", 1, 1, 1);					
							ZerkinzConfig:Print(frameName, "[[ CreateChatWindow ]]:[[ "..tostring(event).." ]]:(( ZerkinzConfig['ChatWindows']['|cffFF0000Zerkinz|rConsole']:AddMessage( "..tostring(event).." = "..tostring(value).." );");
							--ZerkinzConfig['ChatWindows'][frameName]:AddMessage(
							--ZerkinzConfig['Frames']['["EventFunctions"]:UnregisterEvent("PLAYER_LOGIN");
							--ZerkinzConfig['Frames'][frameName]:UnregisterEvent("PLAYER_LOGIN");
							--ZerkinzConfig['Frames'][frameName] = nil;
							]=]

					--local eventFunction	= ZerkinzConfig["EventFunctions"][event] or false;
				
					--ZerkinzConfig:Print("General", 'OnEvent :: '..tostring(eventFunction)..' : '..tostring(event)..' = '..tostring(value)..';');

					--if	type(eventFunction) == 'function' then 
						--return eventFunction(self, event, value, ...);
					--end

					--	end
				--	end
				--end)
				
				--ZerkinzConfig['Frames']['Events']:RegisterEvent("PLAYER_LOGIN");
				--ZerkinzConfig['Frames']['ZerkinzConsole']:RegisterEvent("CVAR_UPDATE");
				--ZerkinzConfig['Frames']['ZerkinzConsole']:RegisterEvent("CONSOLE_MESSAGE");

			--	ZerkinzConfig['ChatWindows']['ZerkinzConsole']:AddMessage("Initializing: |cffFF0000Zerkinz|rConsole", 1, 1, 1);

				--[=[
				for	windowName,windowObject in pairs(ZerkinzConfig.ChatWindows) do
				
					if	type(v) == ("table" or "userdata" or "function") then

						windowObject:AddMessage("[[ ZerkinzConfig ]]:[[ Initialized ]]( "..tostring(windowName).." );\n(( ZerkinzConfig['ChatWindows']['|cffFF0000Zerkinz|rConsole']:AddMessage( "..tostring(event).." = "..tostring(value).." );", 1, 1, 1);

					end

				end
				]=]

				--[[
				_G['__ZerkinzConsole'] = function(chatFrameIndex)

					local chatFrameName		= GetChatWindowInfo(chatFrameIndex) or 'ZerkinzConsole';
					local chatFrameIndex 	= chatFrameIndex or found;
					local chatFrameName 	= chatFrameName or tostring('ChatFrame'..tostring(chatFrameIndex or found));
		
					if	type(chatFrameName) == 'string' and _G[chatFrameName] then						
						return _G[chatFrameName];
					elseif ZerkinzConfig['ChatWindows']['ZerkinzConsole'] then
						return ZerkinzConfig['ChatWindows']['ZerkinzConsole'];
					end
				end		
				]]

				--ZerkinzConfig['ChatWindows']['ZerkinzConsole'] = _G.__ZerkinzConsole(chatFrameIndex);

				 --FCF_OpenNewWindow('ZerkinzConsole', true);	FCF_GetNextOpenChatWindowIndex()

				--_G["ChatFrame"..tostring(ChatWindow_i)]	= _G["ChatFrame"..tostring(ChatWindow_i)] or ZerkinzConfig['ChatWindows']['ZerkinzConsole'];
				--_G["ChatFrame"..tostring(ChatWindow_i)];
				--_G["ChatFrame"..tostring(ChatWindow_i)]:AddMessage("Initializing: [|cffFF0000Zerkinz|rConsole]", 1, 1, 1);

		end	-- frameName not found

		--end)
		--_G['ZerkinzConsole']:AddMessage("Initializing: |cffFF0000Zerkinz|rConsole", 1, 1, 1);
		--ZerkinzConfig['ChatWindows']['ZerkinzConsole']:AddMessage("Initializing: [|cffFF0000Zerkinz|rConsole]", 1, 1, 1);
		--_G["ChatFrame"..tostring(ChatWindow_i)]:AddMessage("Initializing: [|cffFF0000Zerkinz|rConsole]", 1, 1, 1);

	end



	function ZerkinzConfig.Initialize:ConsoleWindow(consoleName, ...)

		local self = _G[AddOnName];
		local consoleName = 'ZerkinzConsole';
		--local CreateChatWindow_return = self:CreateChatWindow(consoleName);
		local createdWindow;
		local windowFrame = Chat_WindowExists(consoleName);

		if	not windowFrame	then
			createdWindow = Chat_CreateWindow('ZerkinzConsole');
			windowFrame = Chat_WindowExists(consoleName)
	
			if	windowFrame  then
				self:Print(consoleName, 'Initialization of '..tostring(consoleName)..' returned '..tostring(createdWindow))
				return windowFrame;
			else
				return false;
			end
		else
			self:Print(consoleName, 'Initialization of '..tostring(consoleName)..' was successful.')
			return windowFrame;
		end

	end



	function ZerkinzConfig.Initialize:ProfileModules(...)

		local self = _G[AddOnName];
		local args = ... and tostring(...);
	
		if type(ZerkinzCfgAcct["activated_modules"]) == "table" and tonumber( arrayKeys(ZerkinzCfgAcct["activated_modules"]) ) > 0 then
			
			ZerkinzConfig:Print("General", "|cffFFFF66Reactivating enabled modules|r, standby..");
	
		
			for k,v in pairs(ZerkinzCfgAcct["activated_modules"]) do
			
				if tostring(v) == "1" or v == 1 then

					--self["Actions"]["Install"](k, args);
					ZerkinzConfig:Print("General", "|cffFF9900Calling|r :: |cffFFFF00Install|r(|cff66FF11",tostring(k),"|r);");
					self.Actions:Install( k, nil, unpack({...}) );
				
				end
			
			end
		
			return true;
	
		else
	
			return false;
	
		end
	
	end	



	--[[	DEPRECATED. REPLACED BY initializeProfiles()
	function ZerkinzConfig:initSavedVars()
	
		_G.ZerkinzCfgAcct		= _G.ZerkinzCfgAcct or {};
		_G.ZerkinzCfgChar		= _G.ZerkinzCfgChar or {};
	
		--ZerkinzCfgAcct = ZerkinzCfgAcct or {};
		--ZerkinzCfgChar = ZerkinzCfgChar or {};	
	
		if	type(ZerkinzCfgAcct) == "table" and type(ZerkinzCfgChar) == "table" then
			
			return true;
		
		else
			
			if	type(ZerkinzCfgAcct) ~= "table" then
			
				ZerkinzCfgAcct = {};
			
			end

			if	type(ZerkinzCfgChar) ~= "table" then

				ZerkinzCfgChar = {};

			end

			return true;
		
		end
	
	end -- end initSavedVars()
	]]



	function  ZerkinzConfig:OnInitialize(...)				
		
		local self	= self or is_table(_G[AddOnName]);

		--ZerkinzConfig:__construct(); --construct_tables('ZerkinzConfig'));

		--[[	if not ZerkinzConfig.__constructed then
					ZerkinzConfig('__construct');
				end	]]

		self.scriptStart = GetTime();

		--[[	Call Compartmentalized Initialization Objects/Methods	]]--
				
				self:InstantiateCoreArrays("true");

				self.Initialize:Profiles();
				self.Initialize:EventsFrame();
				self.Initialize:ConsoleCommands();
				--self.Initialize:ConsoleWindow();
				--self.Initialize:Chat_GetFramesInfo(CHAT_FRAMES);
				--self.Initialize:ConsoleWindow('ZerkinzConsole');
				--self.Initialize:ConsoleCommands();
				--self.Initialize:ProfileModules();
				
				self:InstantiateConsoleCommands();

				self.Actions:LoadSettings('Character');
				self:AcceptPopUp("Accept", "Disable");	
			
				ZerkinzConfig:Print("General", '|cff66FF11' .. tostring(self) .. " => OnInitialize() complete.")
	
				self.scriptEnd = GetTime();
				self.scriptExecution = ( tonumber(self.scriptEnd) or GetTime() ) - ( tonumber(self.scriptStart) or GetTime() );
				self.initialized = true;
	
				ZerkinzConfig:Print("General", ":|cff00FFFFOnInitialize()|r was |cff66FF11executed in|r ", self.scriptExecution, " |cff66FF11seconds.|r");		
	
				return true;

	end -- end onInitialize()



		--ZerkinzConfig:Print("General", "|cffFFFF00=========================|r");			
		--ZerkinzConfig:Print("General", "|cffFF0000ZerkinzCfgAcct['activated_modules']:");
		--self:printArray(ZerkinzCfgAcct["activated_modules"]);
		--ZerkinzConfig:Print("General", "|cffFF0000ZerkinzCfgChar['activated_modules']:");
		--self:printArray(ZerkinzCfgChar["activated_modules"]);	
	


	function	ZerkinzConfig:OnEnable(...)

		local self	= self or is_table(_G[AddOnName]);

		if	self.initialized == true  then
			return;
		else
			return self:OnInitialize(...);
		end

		return

	end
		
		--[=[
		local self = _G[AddOnName];
		
		if not self.initialized then
			--self:Launch();
			self:OnInitialize(...);
		end


		--self.Initialize:ProfileModules(...);
		self.Initialize:Chat_GetFramesInfo(CHAT_FRAMES);
		
		--_G[AddOnName]:CreateChatWindow('ZerkinzConsole');
		
		if	not Chat_WindowExists('ZerkinzConsole') then
			Chat_CreateWindow('ZerkinzConsole');
		end
		self.Initialize:Chat_GetFramesInfo(CHAT_FRAMES);

		self:AcceptPopUp("Accept", "Disable");
		self.Actions:LoadSettings("Character");

		ZerkinzConfig:Print("General", "|cffCC0000ZerkinzConfig|r:|cffFF9900Event|r:|cffFFFF00OnEnable|r(", select(1, ...), ");");
	
	end	
		--[[
		if self:IsPopUpShown() then
		
			ZerkinzConfig:Print("Popup is visible; attempting to accept it..");
			--_G["PopUpAccepted"] =
			self:AcceptPopUp("Accept", "Disable")

		else
		
			--ZerkinzConfig:Print("No popup is visible.");
			--_G["PopUpAccepted"] = self:AcceptPopUp("Accept", "Disable");
		
		end
		]]

		--self:AcceptPopUp("Accept", "Disable");	
		--self:InitializeAddOn();
		--self:InitializeAddOn();
	
		--self:AcceptPopUp("Accept", "Disable");
	



	--_G[tostring(AddOnName) .. "Events"]	= {};
	--local AddOnEvents = tostring(AddOnName) .. "Events";
	--_G[AddOnEvents]["AddOn"] = AddOnName;

	--local launchTime = GetTime();
	--_G["PopUpAccepted"] = _G["PopUpAccepted"] or nil;
	
	]=]

	function ZerkinzConfig:recursivePrint(array)
	
	
		if array and type(array) == "table" then
	
		
			for k,v in pairs(array) do
				
				if type(v) == "table" then
				
					ZerkinzConfig:Print("General", "[",tostring(k),"] => '",tostring(v),"'");	
					ZerkinzConfig:Print("General", "-------------------------");
					self:recursivePrint(v);
				
				
				else
				
					ZerkinzConfig:Print("General", "[",tostring(k),"] => '",tostring(v),"'");	
				
				end -- v == table
			
			
			end -- for array
		
		
		end -- if array
	
	
	end


	function ZerkinzConfig.Functions:ExploreTable(array, arrayName, searchedArrays)

		local _self = self
		local self = _G[AddOnName];
		printArray(array, arrayName, searchedArrays)

		local searchedArrays = ( type(searchedArrays) == 'table' and searchedArrays ) or {};
		local tablePattern 	= '|=[ %s ]::[ %s ]:';
		local keyPattern	= '|-[ %s ]=>[ %s ];';

		if	not array or array and type(array) ~= "table" then
			return false;
		elseif	array and type(array) == "table" then
			
			searchedArrays[tostring(array)] = tostring(array);

			ZerkinzConfig:Print("General",  string.format( tablePattern, tostring(arrayName), tostring(array) ) );
			
			for k,v in pairs(array) do

				if	v and type(v) == "table" then
					
					if	type( searchedArrays[tostring(array)] ) ~= 'nil'	then 
						--ZerkinzConfig:Print("General",  string.format( tablePattern, tostring(arrayName or tostring(array)), tostring('HAS ALREADY BEEN searchedArrays! SKIPPING..') ) );
					else
						printArray(v, k, searchedArrays);
					end
					--[[
					ZerkinzConfig:Print("General",  k .. " => " .. type(v) )

					for	key, val in pairs(v) do 
						ZerkinzConfig:Print("General", "|----  [" .. key .. "] => [" .. tostring(val) .. "];");
					end
					]]
				else
					ZerkinzConfig:Print("General",  string.format( keyPattern, tostring(arrayName), tostring(array) ) );
					--ZerkinzConfig:Print("General", "[" .. k .. "] => [" .. tostring(val) .. "];");
				end
			end	
		end -- end for {} do
	end -- end function printArray()



	function ZerkinzConfig:printArray(array)

		if	not array or array and type(array) ~= "table" then

			return false;

		
		elseif	array and type(array) == "table" then

			for k in pairs(array) do

				local val = array[k];

			
				if	val and type(val) == "table" then

					ZerkinzConfig:Print("General",  tostring(k) .. " => " .. type(val) )

				
					for	z in pairs(val) do 

						local zVal = val[z];
						ZerkinzConfig:Print("General", "|----  [" .. tostring(z) .. "] => [" .. tostring(zVal) .. "];");

					end

				
				else

					ZerkinzConfig:Print("General", "[" .. k .. "] => [" .. tostring(val) .. "];");


				end

			
			end	

		end -- end for {} do

	end -- end function printArray()




	function ZerkinzConfig:printNestedArrays(arrayInput, kv)
		
		if arrayInput and type(arrayInput) == "table" then
		
		local i = 0;
		local v1;
		local v2;
		
				--	print viable modules, one per line to user if no module / moduleName submitted
			for k,v in pairs(arrayInput) do
						
				if kv == "k,v"		then	v1 = k; v2 = v;
				elseif kv == "k"	then	v1 = i; v2 = k;
				elseif kv == "v"	then	v1 = i; v2 = v;
				else 						v1 = k; v2 = v;
				end
							
				if	type(v) == "table"	then
					
					i2 = 0;
					i = tonumber(i) + 1;
					ZerkinzConfig:Print("General", "[" .. tostring(v1) .. "]---- ['" .. tostring(v2) .. "'];");
				
					for key,val in pairs(v) do
				
						i2 = tonumber(i2 or 0) + 1;
						if kv == "k,v"		then	v3 = key; v4 = val;
						elseif kv == "k"	then	v3 = i2; v4 = key;
						elseif kv == "v"	then	v3 = i2; v4 = val;
						else 						v3 = key; v4 = val;
						end					
					
						ZerkinzConfig:Print("General", "|----[" .. tostring(v3) .. "] => ['" .. tostring(v4) .. "'];");
					
					end
				

				end

			end	
		
		else
		
			return false;
		
		end
		
	end


	function ZerkinzConfig:printTableKeys(arrayInput, kv)
		
		if arrayInput and type(arrayInput) == "table" then
		
		local i = 0;
		local v1;
		local v2;
		
				--	print viable modules, one per line to user if no module / moduleName submitted
			for k,v in pairs(arrayInput) do
						
				if kv == "k,v"		then	v1 = k; v2 = v;
				elseif kv == "k"	then	v1 = i; v2 = k;
				elseif kv == "v"	then	v1 = i; v2 = v;
				else 						v1 = k; v2 = v;
				end
							
				if	type(v) == "table"	then
							
					i = tonumber(i) + 1;
					ZerkinzConfig:Print("General", "[" .. tostring(v1) .. "]---- ['" .. tostring(v2) .. "'];");

				end

			end	
		
		else
		
			return false;
		
		end
		
	end

	

	function	ZerkinzConfig.Actions:SelectProfile(...)

		local self = _G[AddOnName];

		local profile, command, parameter, state = ...;

		_G.ZerkinzCfgAcct		= _G.ZerkinzCfgAcct or {};
		_G.ZerkinzCfgChar		= _G.ZerkinzCfgChar or {};	
	
		if args then 
	
			ZerkinzConfig:Print("General", "[|cffFF9900args string|r]: |cffFFFF00", tostring(args), "|r;");
			
			local input = {};
		
			input["Action"], input["Profile"], input["Command"], input["Parameter"], input["State"] = self:GetArgs(..., 5);
		
			if input["Action"] and not input["Profile"] then 
			
				local	iRealm	= 1;
				local	iChar	= 1;
				
				if type(ZerkinzCfgAcct) == "table" and type(ZerkinzCfgAcct["Profiles"]) == "table" then
	
					for k,v in pairs(ZerkinzCfgAcct["Profiles"]) do

						if type(v) == "table" then

							ZerkinzConfig:Print("General", "|cffFFFFFF=========================|r");

							ZerkinzConfig:Print("General", "|CFF66FF11[" .. tostring(iRealm) .. "]=[" .. tostring(k) .. "]|r:");

							ZerkinzConfig:Print("General", "|cffFFFFFF=========================|r");

							for key,val in pairs(v) do

								--ZerkinzConfig:Print("General", "[ " .. tostring(iChar) .. " ]----[" .. tostring(k) .. "-" .. tostring(val) .. "]");
								ZerkinzConfig:Print("General", "|cffFFFF00[" .. tostring(iRealm) .. "]----[" .. iChar .. "]=[" .. tostring(key) .. "]|r");
								iChar = iChar + 1;

							end -- nested for

							iRealm = iRealm + 1;

						end -- if v == table
				
					end -- base for
		
				ZerkinzConfig:Print("General", "|cffFFFFFF=========================|r");
			
				ZerkinzConfig:Print("General", "To select a profile to use, type /ZCfg SelectProfile Realm-Character from the printed list above^^. If the character name you're looking for is not printed, that character does not have a unique Saved Profile.");				
				
				else -- end if ZerkinzCfg["Profiles"]; if false:
				
					ZerkinzConfig:Print("General", "There was an error trying to SelectProfile(). No Profiles were found. Are you sure one exists yet?");
				
				end -- if not ZerkinzCfg["Profiles"]
		
			
			end
		
		
		else
		
			ZerkinzConfig:Print("General", "$args returned false / nil, printing: " .. tostring(args));
		
			return false;
		
		end
		
	
	end


		--[[ Replaced with initializeProfiles();

		_G.ZerkinzCfgAcct 				= _G.ZerkinzCfgAcct or {};
		_G.ZerkinzCfgAcct["Profiles"]	= _G.ZerkinzCfgAcct["Profiles"] or {};

		_G.ZerkinzCfgChar				= _G.ZerkinzCfgChar or {};
		_G.ZerkinzCfgChar["Profiles"]	= _G.ZerkinzCfgChar["Profiles"] or {};

		_G.ZerkinzCfgAcct.loginCount = _G.ZerkinzCfgAcct.loginCount or 0 + 1;
		_G.ZerkinzCfgChar.loginCount = _G.ZerkinzCfgChar.loginCount or 0 + 1;

		local CharacterName, CharacterRealm = UnitName("player");
		local 				 CharacterRealm = GetRealmName();
	
		if CharacterName and CharacterRealm then

			self.CharacterName	= CharacterName;
			self.CharacterRealm	= CharacterRealm;

			--ZerkinzCfgAcct["Profiles"]									=	ZerkinzCfgAcct["Profiles"] or {};
			ZerkinzCfgAcct["Profiles"][CharacterRealm]					=	ZerkinzCfgAcct["Profiles"][CharacterRealm] or {};
			ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName] or {};

			--ZerkinzCfgChar["Profiles"]									=	ZerkinzCfgChar["Profiles"] or {};
			ZerkinzCfgChar["Profiles"][CharacterRealm]					=	ZerkinzCfgChar["Profiles"][CharacterRealm] or {};
			ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName] or {};		

		end					

		self:InstantiateCoreArrays();
	
		if tonumber(ZerkinzCfgAcct.loginCount) <= 1 and tonumber(ZerkinzCfgChar.loginCount) <= 1 then
			
			self.Actions:BackupProfile("All");

		else	

			if	tonumber(_G.ZerkinzCfgAcct.loginCount) <= 1 --[/[and tonumber(_G.ZerkinzCfgChar.loginCount) > 1 ]/] then
		
				self.Actions:BackupProfile("All", "Account");
		
			end

			if	tonumber(_G.ZerkinzCfgChar.loginCount) <= 1 --[/[and tonumber(_G.ZerkinzCfgAcct.loginCount) > 1]/] then
		
				self.Actions:BackupProfile("All", "Character");
		
			end
	
		end

		]]


--[[	if not self["Frames"]["Events"]Loaded and self["Frames"]["Events"]Loaded ~= true then
			self.Initialize:EventsFrame();
		end ]]--
		
		--self["Methods"]["ReactivateModules"]();	

	
	--[[attempt to initialize Account/ZerkinzCfgChars...]]	
		--self:initSavedVars();
	
	
	--[[
		if not	ZerkinzCfgAcct.loginCount or ZerkinzCfgAcct.loginCount and tostring(ZerkinzCfgAcct.loginCount) == "0" then
			ZerkinzCfgAcct.loginCount = 1; 
		
		else
			ZerkinzCfgAcct.loginCount = ZerkinzCfgAcct.loginCount + 1;
		
		end

	
		if not	ZerkinzCfgChar.loginCount then
			ZerkinzCfgChar.loginCount = 1; 
		
		else
			ZerkinzCfgChar.loginCount = ZerkinzCfgChar.loginCount + 1;
		
		end	
	
		ZerkinzCfgAcct.loginCount	= ZerkinzCfgAcct.loginCount or 0 + 1;
		ZerkinzCfgChar.loginCount	= ZerkinzCfgChar.loginCount or 0 + 1;
	]]--

		--[[
		ZerkinzConfig:Print("General", "ZerkinzCfgAcct:");
		self:printTableKeys(ZerkinzCfgAcct["activated_modules"]);
		ZerkinzConfig:Print("General", "ZerkinzCfgChar:");
		self:printTableKeys(ZerkinzCfgChar["activated_modules"]);
		]]-- end old Initialize() shit
	



	--[[
	--// EXPLODE STRING INTO ARRAY[FRAGMENT_i] //--
	--//=======================================//--
		function ZerkinzConfig:UnregisterEvents(unregEvents)

			local self = _G[AddOnName];

			if unregEvents and type(unregEvents) == "table" then

				for k,v in pairs(unregEvents) do
					
					print("|cffFF6600UnregisterEvents:", k, "=", v);

					if tostring(v) == "1" then

						self.Methods:EventHandler(ZerkinzConfig.Frames.Events, "Unregister", k);
						unregEvents[k] = "0";
						ZerkinzConfig:Print("General", "Events:Unregistered => ", k, "=", v, ";");
						
					end
					
				end

				return unregEvents, true;

			elseif unregEvents and type(unregEvents) == "strigng" then

				self.Methods.EventHandler(ZerkinzConfig.Frames.Events, "Unregister", unregEvents)
				ZerkinzConfig:Print("General", "Events:Unregistered => ", k, ";");
				
				--self.PopUpAccepted = "1";

				return unregEvents, true;


			else

				return false; 

			end

		end 
	]]--


	

--[[
	function	ZerkinzConfig:InitializeAddOn()
	
		self.scriptStart = GetTime();
		
		_G.ZerkinzCfgAcct = ZerkinzCfgAcct or {};
		_G.ZerkinzCfgChar = ZerkinzCfgChar or {};
	
	--	Call Compartmentalized Initialization Objects/Methods	--
	
		self.Initialize:EventsFrame();
		self.Initialize:ConsoleCommands();
		
		self:InstantiateCoreArrays();
		self["Methods"]["ReactivateModules"]();	
	
		local CharacterRealm = GetRealmName();
		local CharacterName, Realm = UnitName("player");
		
		if CharacterName and CharacterRealm then
		
			self.CharacterName	= CharacterName;
			self.CharacterRealm	= CharacterRealm;

			if CharacterName and CharacterRealm then

				self.CharacterName	= CharacterName;
				self.CharacterRealm	= CharacterRealm;

				ZerkinzCfgAcct["Profiles"]									=	ZerkinzCfgAcct["Profiles"] or {};
				ZerkinzCfgAcct["Profiles"][CharacterRealm]					=	ZerkinzCfgAcct["Profiles"][CharacterRealm] or {};
				ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName] or {};

				ZerkinzCfgChar["Profiles"]									=	ZerkinzCfgChar["Profiles"] or {};
				ZerkinzCfgChar["Profiles"][CharacterRealm]					=	ZerkinzCfgChar["Profiles"][CharacterRealm] or {};
				ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName] or {};		

			end			
		
		end
	
	--attempt to initialize Account/ZerkinzCfgChars...	
		--self:initSavedVars();
	
		if not	ZerkinzCfgAcct.loginCount then
			ZerkinzCfgAcct.loginCount = 1; 
		else
			ZerkinzCfgAcct.loginCount = ZerkinzCfgAcct.loginCount + 1;
		end

		if not	ZerkinzCfgChar.loginCount then
			ZerkinzCfgChar.loginCount = 1; 
		else
			ZerkinzCfgChar.loginCount = ZerkinzCfgChar.loginCount + 1;
		end	
	
		ZerkinzCfgAcct.loginCount	= ZerkinzCfgAcct.loginCount or 0 + 1;
		ZerkinzCfgChar.loginCount	= ZerkinzCfgChar.loginCount or 0 + 1;
	
	
		ZerkinzConfig:Print("General", "ZerkinzCfgAcct:");
		self:printTableKeys(ZerkinzCfgAcct["activated_modules"]);
		ZerkinzConfig:Print("General", "ZerkinzCfgChar:");
		self:printTableKeys(ZerkinzCfgChar["activated_modules"]);
	
		ZerkinzConfig:Print("General", "|cffFFFF00=========================|r");
	
		ZerkinzConfig:Print("General", "|cffFF0000ZerkinzCfgAcct['activated_modules']:");
		self:printArray(ZerkinzCfgAcct["activated_modules"]);
		ZerkinzConfig:Print("General", "|cffFF0000ZerkinzCfgChar['activated_modules']:");
		self:printArray(ZerkinzCfgChar["activated_modules"]);	
	
	
		self:AcceptPopUp("Accept", "Disable");
	
	
	end
]]


	--[[
	function	ZerkinzConfig.Methods:AcceptPopUp(message, action)
		
		local self = _G[AddOnName];
		local AddOn = _G[AddOnName];
		AddOn:AcceptPopUp(message, action);
	
	end
	]]--


	--[[
	function	ZerkinzConfig.IsPopUpShown()
	
		local self = _G[AddOnName];
		local AddOn = _G[AddOnName];
		AddOn:IsPopUpShown();
	
	end
	]]--




	function ZerkinzConfig:GarbageCollect(autoInstantiate)
	
		--local self = _G[AddOnName];
		self.__temp  			= nil;
		self.ActionsArray 		= nil;
		self.Modules 			= nil;

		self.actionMatch		= nil;
		self.moduleMatch		= nil;	
	
		self.actionObject		= nil;
	
		self.args				= nil;
		self.argArray			= nil;
		self.commandLine_input 	= nil;
		self.commandLine_array	= nil;

		if autoInstantiate and autoInstantiate == "true" then
	
			_G[AddOnName]:InstantiateCoreArrays("true");
	
		end
	
	end



	function ZerkinzConfig:InstantiateCoreArrays(reset)
	
		local self = _G[AddOnName];
		
		self['__temp'] = ( not reset and is_table(self['__temp']) ) or {};

		if not self.ActionsArray or reset == "true" then
		
    		self.ActionsArray = {};
			
			if	self.Actions and type(self.Actions) == "table" then
		
				for k,v in pairs(self.Actions) do

					if type(v) == "function" then
				
						self.ActionsArray[k] = v;

					end
					
				end
		
			end

		end
			--[[
			self.Actions["UpdateDefaults"]		= "UpdateDefaults";
			self.Actions["Install"]				= "Install";
			self.Actions["PrintProfile"] 		= "PrintProfile";
			self.Actions["Uninstall"]			= "Uninstall";
			self.Actions["SaveModule"]			= "SaveModule";		
			self.Actions["SaveProfile"]			= "SaveProfile";
			self.Actions["Support"]				= "Support";
			]]--
		

		if 	type(self.ActionParameters) ~= 'table' then
			
			if	type(self.Actions) == 'table' then
				
				self.NoModuleActions = {};
				self.NoModuleActions['NewFrame'] = 'NewFrame';
				self.NoModuleActions['ToggleFrame'] = 'ToggleFrame';
				self.NoModuleActions['SaveSettings'] = 'SaveSettings';
				self.NoModuleActions['LoadSettings'] = 'LoadSettings';


				self.ActionParameters = {};

				for k,v in pairs(self.Actions) do
					
					if 	keyExists(k, self.NoModuleActions)	then 
						self.ActionParameters[k] = 0;
					else
						self.ActionParameters[k] = 0;
					end

				end

			end

		end
		
		
		if not self.Modules or reset == "true" then
		
			self.Modules = {};
			self.Modules["All"] = {};
			self.Modules["ActionCam"] = {};
			self.Modules["Graphics"] = {};
			self.Modules["Shadows"] = {};
			self.Modules["SoftTarget"] = {};			
	
		end
	
	
	end



	function ZerkinzConfig:InstantiateConsoleCommands(...)
		
		local self = self or _G[AddOnName];

		--[[
		Returns
		commands
		ConsoleCommandInfo[]
		==========================
		Field	Type	Description
		command	string	
		help	string	
		category	Enum.ConsoleCategory	
		commandType	Enum.ConsoleCommandType	
		scriptContents	string	
		scriptParameters	string
		
		Enum.ConsoleCategory
		===========================
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
		Enum.ConsoleCommandType
		Value	Field	Description
		0	Cvar	
		1	Command	
		2	Macro	
		3	Script
		]]


		--[[	CONSOLE CATEGORIES		]]--
		--[[ ==========================	]]--
		
		self['DevConsole'] 					= self['DevConsole'] or {};
		self['DevConsole']['Categories'] 	= {};
		self['DevConsole']['Categories'][0] = 'Debug';
		self['DevConsole']['Categories'][1] = 'Graphics';
		self['DevConsole']['Categories'][2] = 'DevConsole';
		self['DevConsole']['Categories'][3] = 'Combat';
		self['DevConsole']['Categories'][4] = 'Game';
		self['DevConsole']['Categories'][5] = 'Default';
		self['DevConsole']['Categories'][6] = 'Net';
		self['DevConsole']['Categories'][7] = 'Sound';
		self['DevConsole']['Categories'][8] = 'GM';
		self['DevConsole']['Categories'][9] = 'Reveal';
		self['DevConsole']['Categories'][10] = 'None';
		

		--[[	CONSOLE COMMAND TYPES	]]--
		--[[ ==========================	]]--
		
		self['DevConsole']['Types'] 	= {};
		self['DevConsole']['Types'][0] 	= 'CVar';
		self['DevConsole']['Types'][1]	= 'Command';
		self['DevConsole']['Types'][2] 	= 'Macro';
		self['DevConsole']['Types'][3] 	= 'Script';
		self['DevConsole']['Types'][4] 	= 'Unknown';

		--[[	CONSOLE COMMAND TYPES	]]--
		--[[ ==========================	]]--

		self['DevConsole']					= self['DevConsole'] or {};
		self['DevConsole']['Inputs']		= self['DevConsole']['Inputs'] or {};
		self['DevConsole']['CVars']			= self['DevConsole']['CVars'] or {};
		self['DevConsole']['Commands'] 		= self['DevConsole']['Commands'] or {};
		self['DevConsole']['Macros']		= self['DevConsole']['Macros'] or {};
		self['DevConsole']['Scripts'] 		= self['DevConsole']['Scripts'] or {};

		self['DevConsole']['Commands'] 		= self['DevConsole']['Commands'] or {};
		self['DevConsole']['Inputs'] 		= ConsoleGetAllCommands();

		--[[
			ConsoleGetAllCommands() : returns 
			====================================
			Field	Type	Description
			command	string	
			help	string	
			category	Enum.ConsoleCategory	
			commandType	Enum.ConsoleCommandType	
			scriptContents	string	
			scriptParameters	string
		]]		

		self['DevConsole']['Blacklist'] = {

			['graphicsQuality']				= 1;
			['graphicsViewDistance']		= 1;
			['graphicsEnvironmentDetail']	= 1;

		};

		
		local t;
		local ConsoleInputs = {};
		local command;
		local i = nil;

		ZerkinzConfig:Print("General", '----------------------------')
		
		for k,v in pairs(self['DevConsole']['Inputs']) do

			i = ( i or 0 ) + 1;

			if type(v) == 'table' then

				--command = v;
				command = {};
				
				command['command'], command['help'], command['category'], command['commandType'], command['scriptContents'], command['scriptParameters'] = select(1, v);
				local command_name = v.command;
				command.commandType = (command.commandType or 4);
				
				local confirmed_commandType = Console_GetType(command.commandType) or nil;

				if 	confirmed_commandType 	then
					
					local i;
					if 	is_number(k)  then
						i = k;
					else
						i = i;
					end

					local destination = is_table( rawget( self['DevConsole'], tostring(confirmed_commandType)..'s') ) or nil;

					if 	is_table(destination)	then
						rawset(destination, i, command.command);
						--table.insert(destination, i, command.command);
					end

				end

				self:Print( 'General', '|> ', command.command, command.help, command.category, command.commandType, command.scriptContents, command.scriptParameters);
				
				ConsoleInputs[command_name] = {}; --command or v;
				print('['..tostring(k)..']>-[  ', command_name, ' ]>-<[', k, v); 

				for key,val in pairs(command) do
				
					if not val or val == ('' or ' ' or nil or '   ') then
						--don't save this value to array
					elseif command.commandType == (1 or '1') or stringMatch(Console_GetType(command.commandType), "CVar") then

						print('|>---[ ', key, ' ] => ', val, ';');
						ConsoleInputs[command_name] = ( type(ConsoleInputs[command_name]) == 'table' ) or {}; --command or v;
						ConsoleInputs[command_name][key] = val;

					end

				end

				--[[
				for key,val in pairs(command) do
				
					commands[command_name][key] = val;

				end				
				]]
				

				--[[
				for key,val in pairs( ( type(command) == 'table' and v ) ) do
					print('|>-[  ', key, ' ] == ', val); 
					
					if type(val) == 'table' then
						
						for key2, val2 in pairs(val) do
						
							print('|>---[ ', key2, ' ] => ', val2, ';');

						end

					end

				end
				]]

			end

			
		end

		ZerkinzConfig:Print("General", '----------------------------')

		--self.Functions:ExploreTable(self.Console.Commands, tostring(_G[AddOnName]) .. '.Console.Commands')

	end


		--[[
			--ZerkinzConfig:Print("General", "|cffFF9900", tostring(moduleMatch), type(ZerkinzConfig), tostring(ZerkinzConfig), type(self), tostring(self));
		
			--callMethod(self, actionMatch, args);
			--self[actionMatch](self, moduleMatch, args, ...)
		
			--self[actionMatch](self, moduleMatch, args, ...)
		

		elseif	actionMatch and stringMatch("UpdateDefaults", actionMatch) and self.Modules[moduleMatch] then
				
				if moduleMatch == "All" then
		
			
					for k,v in pairs(ZerkinzCfgAcct) do
				
				
						if type(v) == "table" then

							ZerkinzConfig:Print("General", "|-|cff66FF11", tostring(k), " => ", tostring(v), ";|r");		
					
							for	key,val in pairs(v) do

								ZerkinzConfig:Print("General", "|---|cffAAFF44", tostring(key), " => ", tostring(val), ";|r");

							end

						else
					
							ZerkinzConfig:Print("General", "|-|cffFF9900", tostring(k), " => ", tostring(v), ";|r");
					
						end

					end
			
				elseif self.Modules[moduleMatch] then
				
					ZerkinzCfgAcct[moduleMatch] = ZerkinzCfgAcct[moduleMatch] or {};
			
					if type(ZerkinzCfgAcct[moduleMatch]) == "table" then
				
						for k,v in pairs(ZerkinzCfgAcct[moduleMatch]) do


							if type(v) == "table" then

								ZerkinzConfig:Print("General", "|-|cff66FF11", tostring(k), " => ", tostring(v), ";|r");		

								for	key,val in pairs(v) do

									ZerkinzConfig:Print("General", "|---|cffAAFF44", tostring(key), " => ", tostring(val), ";|r");

								end

							else

								ZerkinzConfig:Print("General", "|-|cffFF9900", tostring(k), " => ", tostring(v), ";|r");

							end

						end				
				
						printArray(ZerkinzCfgAcct[moduleMatch]);
						self:PrintTableKeys(ZerkinzCfgAcct[moduleMatch], "k,v");
				
					end -- end if moduleMatch == table
			
				end -- end if moduleMatch == "All" or individual moduleMatch
		
				self:printTableKeys(ZerkinzCfgAcct, "k,v");
				self:printTableKeys(ZerkinzCfgAcct["activated_modules"], "k,v");
		
		elseif	actionMatch and stringMatch(actionMatch, "Uninstall") and moduleMatch then
			
			if	moduleMatch == "All" then
			
				ZerkinzConfig:Print("General", "|cffFFFF66Beginning " .. actionMatch .. "ation of ALL ZerkinzConfig modules, standby..");
			
				for k,v in pairs(self.Modules) do
				
					--DEBUG: ZerkinzConfig:Print("General", tostring(k), type(k), tostring(v), type(v));
				
					if k ~= "All" and type(v) == "table" then
						
						self:Install(k, args, "true")
						--DEBUG: ZerkinzConfig:Print("General", "Beginning to copy .. " .. tostring(k), tostring(v));
						--self.Modules["All"] = copyTable(v);
						--copyTable(v, self.Modules["All"]);
					
					end
				
				end
			
			else		
		
				ZerkinzConfig:Print("General", "|cffFFFF66Beginning to " .. actionMatch .. " the ['" .. moduleMatch .. "'] module, standby..");
				self:Install(moduleMatch, args, "true");		
		
			end
		
		elseif	actionMatch and stringMatch(actionMatch, "Install") and moduleMatch then

			if	moduleMatch == "All" then
			
				ZerkinzConfig:Print("General", "|cffFFFF66Beginning " .. actionMatch .. "ation of ALL ZerkinzConfig modules, standby..");
			
				for k,v in pairs(self.Modules) do
				
					--DEBUG: ZerkinzConfig:Print("General", tostring(k), type(k), tostring(v), type(v));
				
					if k ~= "All" and type(v) == "table" then
						
						self:Install(k, args)
						--DEBUG: ZerkinzConfig:Print("General", "Beginning to copy .. " .. tostring(k), tostring(v));
						--self.Modules["All"] = copyTable(v);
						--copyTable(v, self.Modules["All"]);
					
					end
				
				end
			
			else		
		
				ZerkinzConfig:Print("General", "Beginning to " .. actionMatch .. " the ['" .. moduleMatch .. "'] module, standby..");
				self:Install(moduleMatch, args);		
		
			end
		
		elseif	stringMatch(actionName, self.Actions) and stringMatch (actionName, "Support") then
			
				self:Support();
				return true;
		
		else
			
			--self:printTableKeys(self.Actions, "k");
			--printArray(self.Modules);
			
			--print(actionName, stringMatch(actionName, self.Actions));
			--print(moduleName, stringMatch(moduleName, self.Modules));

			if	actionName and stringMatch(actionName, self.Actions)	then
				actionName = stringMatch(actionName, self.Actions);
			end
				
			if	stringMatch(moduleName, self.Modules)	then
				moduleName = stringMatch(moduleName, self.Modules);
			end		

			--DEBUG: ZerkinzConfig:Print("General", "post replacement actionName =>", actionName, stringMatch(actionName, self.Actions), "post replacement moduleName =>", moduleName, stringMatch(moduleName, self.Modules));
			
			
	--	if action/first parameter set & found..	
			if stringMatch(actionName, self.Actions)	then	-- if action/first parameter exists .. 		

				ZerkinzConfig:Print("General", tostring(self) or nil .. " " .. tostring(actionName) .. " found;")	
			
			
		--	if no module/second parameter or not in existance..	
				if not moduleName or not stringMatch(moduleName, self.Modules) then 

					ZerkinzConfig:Print("General", "You must select a module to install. Select from the following (you can install individual modules separately with subsequent slash commands):");
					local i = 0;	
					
					ZerkinzConfig:Print("General", type(self.Modules), self.Modules);
				
					self:printTableKeys(self.Modules, "k");

					return false;
				
		--	if module/second parameter set & found..			
				elseif moduleName and stringMatch(moduleName, self.Modules) then
				
					ZerkinzConfig:Print("General", "[" .. moduleName .. "] found; beginning install..");
				
					--printArray(self.Modules);
				
					local installStatus = self:Install(moduleName, args);
					
					--self:AcceptPopUp();

					if installStatus == "true" or installStatus == true then
						
						ZerkinzCfgAcct.moduleMatch = 1; 
						
						ZerkinzConfig:Print("General", tostring(moduleName) .. " has been successfully installed. Don't forget that additional modules can be installed, restored, or reset individually at any time!");
					
						return true;


					elseif installStatus == "false" or installStatus == false then
					
						self.moduleMatch = 0;
					
						ZerkinzConfig:Print("General", tostring(moduleName) .. " encountered an error while installing. Report the problem to Zerkinz. You can contact me at Zerkinz#1271 or the following characters on US-Illidan: Xerret, Xerkin, Xerkinz, Zerkin, Zerkinz, or Occulteth.");

						return false;

					                     
					else

						self.moduleMatch = 0;	
					
						ZerkinzConfig:Print("General", "There was a problem executing the InstalleModule() function/method. Report the problem to Zerkinz. You can contact me at Zerkinz#1271 or the following characters on US-Illidan: Xerret, Xerkin, Xerkinz, Zerkin, Zerkinz, or Occulteth.");

						return false;
					
					
					end

				end
			
			end
		
		end -- if not actionName

		return false;
			
		-- ZerkinzConfig:Print("General", actionName, moduleName, parameter1)
		
	end -- end ZerkinzConfig.Console()
	]]


	--[[
	function	ZerkinzConfig.DevConsole:is_blacklisted(s, blacklist_table)

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
	]]

	function	ZerkinzConfig:EventManager(event, ...)
	
		local 	params = { ... };
		local 	self = _G[AddOnName];
		local 	ZerkinzEventFrame = _G[AddOnName]["Frames"]["Events"];

		ZerkinzConfig:Print("General", "EventManager(" .. tostring(event or 'NULL') ..  ", " .. tostring(eventParameters or 'NULL') .. ", " .. tostring(actionName or 'NULL') .. ", " .. tostring(moduleName or 'NULL') .. ");");


		if type(self.PopUpEvents) == "table" and self.PopUpEvents[event] and tonumber(self.PopUpEvents[event]) == 1  then

			if self:IsPopUpShown() then 

				self:AcceptPopUp("Accept", "Disable");
				
			end


			local activePopUp = self:IsPopUpShown();
		
			if	not activePopUp and self.PopUpAccepted == "1" then
			
	
				--_G[AddOnName].Methods:EventHandler(ZerkinzConfig.Frames.Events, "Unregister", 'PLAYER_STARTED_TURNING');
				_G[AddOnName].Methods:EventHandler(self["Frames"]["Events"], "Unregister",  _G[AddOnName]["PopUpEvents"]);
				_G[AddOnName].Methods:EventHandler(self["Frames"]["Events"], "Unregister",  _G[AddOnName]["PopUpEvents"]);
				
				self.PopUpEvents = nil;
	
					--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_MOVING')
					--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_TURNING')
					----self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'GLOBAL_MOUSE_DOWN')
					--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'CURSOR_UPDATE')			
			
			else
		
			--if not _G["PopUpAccepted"] then
			
				--_G["PopUpAccepted"] =
				self:AcceptPopUp("Accept", "Disable");
	
				if _G["PopUpAccepted"] and	( type(self["Frames"]["Events"]) == 'table' 	or		type(_G[AddOnName]["Frames"]["Events"]) == 'table' )	then
							
					--DEBUG: ZerkinzConfig:Print("General", "PopUpAccepted and _G[AddOnName]["Frames"]["Events"] and not _G.eventUnregistered");
						
					--self.Methods:EventHandler("_G[AddOnName]["Frames"]["Events"], "Unregister", 'PLAYER_STARTED_MOVING')
					--self.Methods:EventHandler("_G[AddOnName]["Frames"]["Events"], "Unregister", 'PLAYER_STARTED_TURNING')
					----self.Methods:EventHandler("_G[AddOnName]["Frames"]["Events"], "Unregister", 'GLOBAL_MOUSE_DOWN')
					--self.Methods:EventHandler("_G[AddOnName]["Frames"]["Events"], "Unregister", 'CURSOR_UPDATE')
				
					--PopUpAccepted = nil;
							
				end -- if PopUpAccepted 
			
			end -- if NOT PopUpAccepted					

		elseif type(self.PopUpEvents) == "table" then

			--ZerkinzConfig:Print("General", "EventManager(" .. tostring(event or 'NULL') ..  ", " .. tostring(actionName or 'NULL') .. ", " .. tostring(moduleName or 'NULL') .. ");");
			ZerkinzConfig:Print("General", "EventManager(): Unsetting self.PopUpEvents ..")
			self.PopUpEvents = nil;

		end

	end



	function ZerkinzConfig:IsPopUpShown(AcceptIfShown, clickButtonName, ...)
		
		local self = _G[AddOnName];
		local buttonChecklist = { ... };
		local self = _G[AddOnName];
		local PopUpShown;
		local PopUpFrame;

		self.PopUpChecks = ( self.PopUpChecks or -1 ) + 1;

		if self.PopUpChecks >= 15 then


			if	type(self.PopUpEvents) == "table" then

				--self.PopUpEvents = self:UnregisterEvents(self.PopUpEvents);	
				--//self.Methods:EventHandler(ZerkinzConfig.Frames.Events, "Unregister", self.PopUpEvents); 
				--//self.PopUpEvents = nil;

			end

			self.PopUpChecks = 0;
			return false;

		end

		for i = 1, 5 do

			local	PopUpString = "StaticPopup" .. tostring(i);
					PopUpFrame = _G[PopUpString];
			
			if	PopUpFrame then
				self.PopUpFrame = PopUpFrame;
				PopUpShown = PopUpFrame:IsShown();
			else
				self.PopUpFrame = nil;
				PopUpShown = false;
			end

			if	PopUpFrame and PopUpShown then

				--DEBUG: ZerkinzConfig:Print("General", "PopUpFrame and isShown() == false")
				--_G["PopUpAccepted"] = true;
				--ZerkinzConfig:Print("General", "There was no popup to accept.");

				self.PopUpFrame = PopUpFrame;
				return true, PopUpFrame;

			elseif PopUpFrame and not PopUpShown--[[ and not blacklisted[PopUpFrame.which] ]] then
			
				-- placeholder
				if	type(self.PopUpEvents) == "table" and self.PopUpAccepted == "1" then

					--self.PopUpEvents = self:UnregisterEvents(self.PopUpEvents);
					self.Methods:EventHandler(ZerkinzConfig.Frames.Events, "Unregister", self.PopUpEvents); 
					self.PopUpEvents = nil;
					self.PopUpFrame = nil;	

				end
			
			end
		
		end

		return false, nil;
	
	end



	function ZerkinzConfig:AcceptPopUp(...)
		
		local self = _G[AddOnName];
	
		local failed;
		local PopUpButtons = {};
		local button_i = 1;
		local clickButtonName, clickButtonName_2, clickButtonName_3  = ...;
		local buttonChecklist = ( type(arg) == 'table' and arg or { ... } ) or nil;
		local buttonsToFind = ( #buttonChecklist or 0 );
		local buttonsFound = 0;
		local clickButtonObj;
		local buttonObj;
		local buttonObjText;

		if ( clickButtonName ) and ( tonumber(buttonsToFind) == 0 ) then
			buttonsChecklist[1] = clickButtonName;
			buttonsToFind = 1;
		end

		--local clickButtonName = buttonChecklist[1];
		
		if clickButtonName and type(clickButtonName) == 'string' then 
			self.clickButtonName = clickButtonName;
		end

--[[ for 1 < 5, check StaticPopUp .. i frame:IsShown	 ]]		
		for i = 1, 5, 1 do

			
			local PopUpFrameString = "StaticPopup" .. tostring(i);
			PopUpFrame = _G["StaticPopup" .. tostring(i)];

			if	PopUpFrame and PopUpFrame:IsShown() then

				ZerkinzConfig:Print("General", "StaticPopUp" .. tostring(i) .. ":IsShown()");

				buttonsFound = 0;
				failed = false;
				success = true;

		--[[	for (buttonCheckList)	]]
				for k,v in pairs(buttonChecklist) do


					buttonObj = _G[PopUpFrameString .. "Button" .. tostring(k)];
					buttonObjText = buttonObj:GetText();

					if 	clickButtonName == buttonObjText or stringMatch(clickButtonName, buttonObjText) then
						self.clickButtonObj = buttonObj;
						clickButtonObj = buttonObj;
					end


					if	buttonObj:IsShown() and ( buttonObjText == buttonChecklist[k] or stringMatch(buttonChecklist[k], buttonObjText) ) then
						ZerkinzConfig:Print("General", "|cff66FF11AcceptPopUp()|r: |cff66FF11Matched StaticPopUpFrame['" .. tostring(i) .. "']Button['" .. tostring(k) .. "']:|cffFFFF00" .. tostring(buttonChecklist[k]) .. "|r to " .. tostring(buttonObjText) .. " to PopUp, Button = " .. tostring(i) .. tostring(k) .. "|r; continuing..");
						buttonsFound = ( buttonsFound or 0 ) + 1;

					else
						ZerkinzConfig:Print("General", "|cffFF0000AcceptPopUP()|r: |cffFF9900Failed to match |cffFFFFStaticPopUpFrame['" .. tostring(i) .. "']Button['" .. tostring(k) .. "']:|cffFFFF00" .. tostring(buttonChecklist[k]) .. "|r to " .. tostring(buttonObjText) .. " to PopUp, Button = " .. tostring(i) .. tostring(k) .. "|r; stopping.");
						failed = 'true';
						success = false;
						
					end


				end
				

				if ( tonumber(buttonsFound) == tonumber(buttonsToFind) ) or ( success == true ) or ( success ~= false and success ~= nil ) then
					
					ZerkinzConfig:Print("General", "Attempting to click " .. tostring(self.clickButtonName) .. ", standby..");
					clickButtonObj:Click();
					
					local buttonShown = clickButtonObj:IsShown();
					local PopUpFrameShown = PopUpFrame:IsShown();

					self.PopUpFrameShown = PopUpFrameShown;
					self.buttonShown = buttonShown;
					

					ZerkinzConfig:Print("General", "|cff66FF11AcceptPopUp()|r attempted to click [|cffFFFF00" .. tostring(clickButtonName) .. "|r] button. ButtonShown = " .. tostring(buttonShown) .. ".");
					ZerkinzConfig:Print("General", "IsShown() = " .. tostring(clickButtonObj:IsShown()) .. "; buttonShown = " .. tostring(buttonShown));

					if (type(self.PopUpEvents) == "table" ) and ( not PopUpFrameShown or PopUpFrameShown ~= true or buttonShown == nil or buttonShown == false or buttonShown ~= true ) then 
			
						ZerkinzConfig:Print("General", "|cff66FF11Successfully clicked |r['" .. tostring(clickButtonName) .. "']|cff66FF11! Unregistering PopUpEvents..");
						self.Methods:EventHandler(ZerkinzConfig.Frames.Events, "Unregister", self.PopUpEvents);
						self.PopUpEvents = nil;
						self.PopUpAccepted = "1";
			
					end

					return buttonShown, clickButtonObj;

				end

				--DEBUG: ZerkinzConfig:Print("General", "PopUpFrame and isShown() == false")
				--_G["PopUpAccepted"] = true;
				--ZerkinzConfig:Print("General", "There was no popup to accept.");
				
				self.PopUpFrame = PopUpFrame;
				return false, PopUpFrame;
			

			elseif ( not PopUpFrame ) or ( PopUpFrame and not PopUpFrame:IsShown() )--[[ and not blacklisted[PopUpFrame.which] ]] then
			
				if type(self.PopUpEvents) == "table" and self.PopUpAccepted == "1" then 

					self.Methods:EventHandler(_G[AddOnName]["Frames"]["Events"], "Unregister", self.PopUpEvents); 
					self.PopUpEvents = nil;

				end
				
				self.PopUpFrame = nil;
				--self.PopUpEvents = nil;

				return false; -- placeholder
			
			end
		
		end

		return false, nil;
	
	end
	

	--[[
	function ZerkinzConfig:AcceptPopUp(button1Text, button2Text)
	
		local	self = _G[AddOnName];
			 	self.PopUpFrame = self.PopUpFrame or nil;
	
		local 	button1;
		local 	button2;
		local 	DefaultPopUpString	= "StaticPopup1";
		local	DefaultPopUpFrame	= _G[DefaultPopUpString];
		local	PopUpString;
		local 	PopUpFrame;
		local 	temp_PopUpFrame;
		local 	temp_PopUpString;

		self.PopUpString = DefaultPopUpString;
		self.PopUpFrame = _G[self.PopUpString];

		--DEBUG: ZerkinzConfig:Print("General", "AcceptPopUp(" .. tostring(button1Text) .. " .. " .. tostring(button2Text) .. ");");
	
		--if button1 then
			
			if DefaultPopUpFrame and DefaultPopUpFrame:IsShown() then 
				
				ZerkinzConfig:Print("General", "AcceptPopUp :: DefaultPopUpFrame:IsShown();");
				self.PopUpString = DefaultPopUpString;
				self.PopUpFrame = DefaultPopUpFrame;
				PopUpString = DefaultPopUpString;
				PopUpFrame = DefaultPopUpFrame;

			elseif self.PopUpFrame and _G[tostring(self.PopUpString)] and self.PopUpFrame:IsShown() then 
				
				ZerkinzConfig:Print("General", "AcceptPopUp :: self.PopUpFrame:IsShown();");
				PopUpString = self.PopUpString; 
				PopUpFrame = self.PopUpFrame;
		
			elseif not self.PopUpFrame or _G[tostring(self.PopUpFrame)] and not _G[tostring(self.PopUpFrame)]:IsShown() then
	
				for i = 1, 3 do

					--PopUpString = "StaticPopup" .. tostring(i);
					temp_PopUpString = "StaticPopup" .. tostring(i);
					temp_PopUpFrame = _G[temp_PopUpString];

					if	temp_PopUpFrame and temp_PopUpFrame:IsShown() then

						--DEBUG: ZerkinzConfig:Print("General", "PopUpFrame and isShown() == false")
						--_G["PopUpAccepted"] = true;
						--ZerkinzConfig:Print("General", "There was no popup to accept.");
						--return true;

						-- PopUpFrame is valid .. 
						ZerkinzConfig:Print("General", "AcceptPopUp :: StaticPopUp[" .. tostring(i) .. "]:IsShown();");
					
						self.PopUpString = temp_PopUpString;
						self.PopUpFrame = _G[temp_PopUpString];
						PopUpString = temp_PopUpString;
						PopUpFrame = _G[PopUpString];

					end
				
				end
		
			else
				
				self.PopUpFrame = false;
				PopUpFrame = false;
				--return false;
		
			end

			--if self.PopUpFrame and self.PopUpFrame ~= false then
				
				--ZerkinzConfig:Print("General", "PopUpFrame = " .. tostring(PopUpFrame) .. ";");
	
			--end


	
			if self.PopUpFrame and self.PopUpFrame:IsShown() ]] --[[ and not blacklisted[PopUpFrame.which] ]] 
			
			--[[then

				--DEBUG: ZerkinzConfig:Print("General", "PopUpFrame and isShown()");
				ZerkinzConfig:Print("General", "self.PopUpFrame:isShown()");
			
				--button1 = _G[tostring(PopUpFrame) .. "Button1"]; -- /run local b = _G["StaticPopup1Button1"]; print(b)
				--button2 = _G[tostring(PopUpFrame) .. "Button2"];					
				button1 = _G[tostring(PopUpString) .. "Button1"]	
				button2 = _G[tostring(PopUpString) .. "Button2"]

				if button1Text and button2Text then

					if button1Text and button1:IsShown() and stringMatch(button1Text, button1:GetText()) then

						ZerkinzConfig:Print("General", "Button1 Matches.");

						if button2Text and button2:IsShown() and stringMatch(button2Text, button2:GetText()) then

							ZerkinzConfig:Print("General", "Button2 Matches.;");

							_G["PopUpAccepted"] = true;
							_G[AddOnName].PopUpAccepted = true;

							button1:Click();
							ZerkinzConfig:Print("General", "|cff66FF11The popup window button [" .. tostring(button1:GetText()) .. "] was automatically Clicked() for your convenience.|r");
							
							--self.PopUpEvents = self.UnregisterEvents(self.PopUpEvents);
							_G[AddOnName].Methods:EventHandler(_G[AddOnName]["EventLog"], "Unregister", _G[AddOnName]["PopUpEvents"]);
							ZerkinzConfig:Print("General", "|cff66FF11|»>»>»>ATTEMPTED TO UNREGISTER PopUpEvents\n##########\n@@@@@@@@\n#########\n@@@@@@@@@@@@@"); 


						end
						
					end
				
				end ]]

				--[[
				if button1 and button1:IsShown() then
				
					--DEBUG: ZerkinzConfig:Print("General", "Button [" .. tostring(button1) .. "] exists and isShown()");
				
					if not button1Text and not stringMatch("Cancel", button1:GetText()) then
							
						--DEBUG: ZerkinzConfig:Print("General", "Button1Text [" .. tostring(button1Text) .. "] and not stringMatch 'cancel'");
						--_G["PopUpAccepted"] = true;
				
						button1:Click();
						
						ZerkinzConfig:Print("General", "|cff66FF11The popup window button [" .. tostring(button1:GetText()) .. "] was automatically Clicked() for your convenience.|r");
						
						self.UnregisterEvents(ZerkinzConfig.Frames.Events, "Unregister", self.PopUpEvents);

						--self.Methods.EventHandler(ZerkinzConfig.Frames.Events, "Unregister", self.PopUpEvents);

						return true;
						
					elseif button1Text and button1:IsShown() and stringMatch(button1Text, button1:GetText()) then
							
						--DEBUG: ZerkinzConfig:Print("General", "stringMatched " .. button1Text)
						
						if not button2Text then
								
							--DEBUG: ZerkinzConfig:Print("General", "No button2Text");
							--_G["PopUpAccepted"] = true;
					
							button1:Click();
							ZerkinzConfig:Print("General", "|cff66FF11The popup window button [" .. tostring(button1:GetText()) .. "] was automatically Clicked() for your convenience.|r");
							
							self.PopUpEvents = self:UnregisterEvents(self.PopUpEvents);
					
							return true;
						
							
						elseif button2Text and button2:IsShown() and stringMatch(button2Text, button2:GetText()) then
								
							--DEBUG: ZerkinzConfig:Print("General", "Button [" .. tostring(button2) .. "] is shown() and stringMatched");
					
							_G["PopUpAccepted"] = true;
							self.PopUpAccepted = true;

							button1:Click();
							ZerkinzConfig:Print("General", "|cff66FF11The popup window button [" .. tostring(button1:GetText()) .. "] was automatically Clicked() for your convenience.|r");
							
							self:UnregisterEvents(self.PopUpEvents);
							


							
							--for k,v in pairs(self.PopUpEvents) do
						
								--if v == "1" then
									--self.Methods:EventHandler(ZerkinzConfig.Frames.Events, "Unregister", k);
								--end
						
							--end
							
							
							return true;	
							
						else
								
							--_G["PopUpAccepted"] = true;
					
							button1:Click();
							return true;
						
						end
						
						
					elseif stringMatch("Cancel", button1:GetText() ) then
				
						ZerkinzConfig:Print("General", "button1 stringMatched 'Cancel'");
						-- do nothing
						return false;	
						
					else
					
						return nil;
					
					--end
					
						--button1:Click()
					
					end	-- end if button 
				
				end	-- end if PopUpFrame
				
				]]--
				--[[

			end	-- end for i, 10
		
		--end	-- if button

	end
	]]
	

	function ZerkinzConfig.Actions:Support()
	
		ZerkinzConfig:Print("General", "Reminder: Zerkinz, the creator of this addon and the rest of the ZerkinzUI suite were manifested via my own blood, sweat, & tears. When my stimulus ran out, I chose to prioritize the creation of this addon (ZerkinzConfig) and ZerkinzLib, as I wanted to cement my legacy, and give back to the community that have given me so much over the years by taking PERSONAL RESPONSIBILITY to do whatever was in my power to make the game the best it can be (given the freedom & tools available to players) FOR ALL OF US, rather than selfishly hoarding my beneficial innovations to myself for a competitive edge.");
	
		ZerkinzConfig:Print("General", "Financially, I am in a really shitty position. I am flat broke, can barely manage to make it to the Methadone clinic in the next town over on a daily basis. If you are in a position to, and are willing to help, you can send your support via PayPal to:");
	
		ZerkinzConfig:Print("General", "ZerkinzGaming.com or RypeDesigns@gmail.com. Shortcuts you can try are: www.tinyurl.com/SupportZerkinzUI and www.tinyurl.com/SupportZerkinzGaming -- thanks in advance! Literally ANYTHING is appreciated; even a $0.25, no sarcasm.");
	
		return true;
	
	end


	
	function ZerkinzConfig.Actions:Install(moduleName, resetDefaults, ...)
		
		_G[AddOnName]:Print("General", "|cff66FF11>> [[", tostring(self), "]]");
		_G[AddOnName]:Print("General", "|cff66FF11>> [[", tostring(moduleName), "]]");
	
		local self = _G[AddOnName];
		local args = select("#", ...) > 0 and tostring(...) or nil;
		--self:InstantiateCoreArrays("true");

		--printArray(self.Modules)
	
		--ZerkinzConfig = _G["ZerkinzConfig"];
		--print(tostring(moduleName), type(ZerkinzConfig), tostring(ZerkinzConfig), type(self), tostring(self));
		--ZerkinzConfig:Print("General", tostring(moduleName), type(ZerkinzConfig), tostring(ZerkinzConfig), type(self), tostring(self));
		--print("|cff66FF11[self] => ", tostring(self), ";\ntype(self) => ", type(self), "|r");
		--print(tostring(ZerkinzConfig));
	

		--if type(self) ~= "table" then local self = _G["ZerkinzConfig"]; end
	
		--ZerkinzConfig:Print("General", tostring(moduleName), type(ZerkinzConfig), tostring(ZerkinzConfig), type(self), tostring(self));
	
		local returnStatus;
		local actionString;
		local actionSign;
		local actionColor;
		local moduleActivated;
		local moduleMatch = keyExists(moduleName, self.Modules) or stringMatch(moduleName, self.Modules); 
	
		if	resetDefaults and type(resetDefaults) == "string" and string.lower(resetDefaults) == "true" then

			actionString	=	'Uninstall';
			actionSign		=	'[-]';
			actionColor		=	'FF0000';
		
			if moduleMatch then 
				
				moduleActivated = 0;
			
				ZerkinzCfgAcct["activated_modules"] 							=	ZerkinzCfgAcct["activated_modules"] or {};
				ZerkinzCfgAcct["activated_modules"][moduleMatch]				=	moduleActivated;
				
				ZerkinzCfgChar["activated_modules"]								=	ZerkinzCfgChar["activated_modules"] or {};
				ZerkinzCfgChar["activated_modules"][moduleMatch]				=	moduleActivated;
			
				ZerkinzCfgAcct["activated_modules"] 							=	ZerkinzCfgAcct["activated_modules"] or {};
				ZerkinzCfgAcct["activated_modules"][moduleMatch]				=	moduleActivated;
			
				ZerkinzCfgChar["activated_modules"]								=	ZerkinzCfgChar["activated_modules"] or {};
				ZerkinzCfgChar["activated_modules"][moduleMatch]				=	moduleActivated;			
				
				setval('ZerkinzConfig.Profiles.Active', ZerkinzCfgChar["activated_modules"] or {} ) 
				--ZerkinzConfig.Profiles.Active["activated_modules"]				=	ZerkinzCfgChar["activated_modules"]	--ZerkinzConfig.Profiles.Active["ActiveModules"] or {};
				--ZerkinzCfgChar["activated_modules"]	
				--setval('ZerkinzConfig.Profiles.Active', ZerkinzCfgChar["activated_modules"] or {} )
				--ZerkinzConfig.Profiles.Active["activated_modules"][moduleMatch]	=	moduleActivated;

			end
				
		
		else

			actionString	= 'Install';
			actionSign 		= '[+]';
			actionColor		= 'FF9900';
		
			if moduleMatch then

				moduleActivated = 1;
		
				ZerkinzCfgAcct["activated_modules"] 							=	ZerkinzCfgAcct["activated_modules"] or {};
				ZerkinzCfgAcct["activated_modules"][moduleMatch]				=	moduleActivated;
			
				ZerkinzCfgChar["activated_modules"]								=	ZerkinzCfgChar["activated_modules"] or {};
				ZerkinzCfgChar["activated_modules"][moduleMatch]				=	moduleActivated;

				setval('ZerkinzConfig.Profiles.Active', ZerkinzCfgChar["activated_modules"] or {} ) 
				--ZerkinzConfig.Profiles.Active["activated_modules"]				=	ZerkinzConfig.Profiles.Active["ActiveModules"] or {};
				--ZerkinzConfig.Profiles.Active["activated_modules"][moduleMatch]	=	moduleActivated;
			
			end
	
		
		end

	
		if	not moduleName then
			
			ZerkinzConfig:Print("General", "|cffFF0000" .. tostring(actionString) .. "()|r -> |cffFFFF00No module name was submitted!");
			return false;
		
		elseif not moduleMatch then
		
			ZerkinzConfig:Print("General", "|cffFF0000" .. tostring(actionString) .. "Module(" .. tostring(moduleMatch) .. ")|r :: There was an error matching your requested module (['" .. tostring(moduleName) .. "']) to an entry in the array of modules.")
		
		else
		
			ZerkinzConfig:Print("General", "|cff66FF11" .. tostring(actionString) .. "Module(" .. tostring(moduleMatch) .. ")|r :: Beginning " .. tostring(actionString) .. "ation of [" .. tostring(moduleMatch) .. "], standby..");
	
		
			if 	moduleMatch and self.Modules[moduleMatch] then
			
				ZerkinzConfig:Print("General", actionString .. "Module -> " .. moduleMatch .. " was found in the list of modules.");
		
				self:InstantiateModule(moduleMatch);

				local moduleTable = self.Modules[moduleMatch];

				ZerkinzConfig:Print("General", '// PRINTING MODULE >> ', moduleMatch);

				for k,v in pairs(moduleTable) do
					
					ZerkinzConfig:Print('ZerkinzConsole', '[', k, '] = ', v);

				end

				returnStatus =  true;

				--self:InstantiateModule(moduleMatch);
			
				--[[
				local saveStatus = self:UpdateDefaults(moduleMatch);
		
				if saveStatus then
					
					ZerkinzConfig:Print("General", "|cff66FF11BackupProfile(" .. moduleMatch .. ")|r :: |cffFFFF66Successfully saved your existing settings regarding the module ['" .. moduleMatch .. "'] to the WTF folder.|r");
				else
					
					ZerkinzConfig:Print("General", "|cffFF0000BackupProfile(" .. moduleMatch .. ")|r :: |cffFFFF66There was a problem saving your existing settings regarding the module ['" .. moduleMatch .. "'] to the WTF folder.|r");
				end
				]]--
		
			--[[now that the requested array values are instantiated, apply them using SetCVar()]]
				
				--if self.Modules[moduleMatch] then
			
					for k,v in pairs(self.Modules[moduleMatch]) do
				
						local CVarDefault = nil;
						local returnV;
				
				--[[	IF	ACTION = INSTALL -> SET CVAR FUNCTION..	]]
						if	actionString == "Install" then
							
							returnStatus	= C_CVar.SetCVar(k, v) or SetCVar(k, v);
							SetCVar(k, v);
							ZerkinzConfig:Print("General", k, ' => ', v, '; k = ', C_CVar.GetCVarDefault(k));
							
				--[[	ELSEIF 	ACTION = UNINSTALL -> SET DEFAULT CVAR FUNCTION..	]]
						elseif	actionString == "Uninstall" then
					
							local CVarDefault = C_CVar.GetCVarDefault(k) or GetCVarDefault(k)
							
							if	CVarDefault then
						
								returnStatus = C_CVar.SetCVar(k, CVarDefault) or SetCVar(k, CVarDefault);
						
							end
					
						end	
						
						if	CVarDefault then
							
							returnV = CVarDefault;

						else	
						
							returnV = v;
						
						end
				
						if	returnStatus == true or returnStatus == "true" then
							
							--ZerkinzCfgAcct["ZerkinzConfig.Used"] = true;
							--ZerkinzCfgAcct[moduleMatch] = 1;
							returnStatus = true;
							--ZerkinzConfig:Print("General", "|cff66FF11" .. actionSign .. " " .. actionString .. "ed " .. actionSign .. "|r : ['" .. k .. "'] => '" .. returnV .. "';");

						elseif returnStatus == "false" or returnStatus == false then
							
							--ZerkinzCfgAcct[moduleMatch] = 0;
							returnStatus = false;
							--ZerkinzConfig:Print("General", "|cffFF0000[!] ERROR " .. string.upper(actionString) .. "ING [!]|r : ['" .. k .. "'] => '" .. returnV .. "';");

						end

					end	
			
				--end
		
				ZerkinzConfig:Print("General", "|cffFFFF33InstallModule('" .. moduleMatch .. "')|r :: |cFF" .. tostring(actionColor) .. tostring(actionSign) .. " " .. tostring(actionString) .. " [" .. tostring(moduleMatch) .. "] " .. tostring(actionSign) .. "|r;");
		
				self:AcceptPopUp("Accept", "Disable");
			
				if returnStatus == true then
					return returnStatus;
				else
					return false;
				end
		
			else
				
				ZerkinzConfig:Print("General", actionString .. "Module -> Module was not matched." .. moduleMatch);
				return false;
				
			end
	
		end -- end the if not moduleName, elseif not moduleMatch, else{  all the above}
			
		--else
			
			--return false;
			
		--end -- end if installConfirmed
		
		--return false;		
		
	end -- end function ModuleInstaller()



	function ZerkinzConfig.Actions:Uninstall(moduleName)
	
		local self = _G[AddOnName];
	
		local moduleMatch = stringMatch(moduleName, self.Modules); 
	
		if self.Modules[moduleMatch] then
		
			ZerkinzConfig:Print("General", "Calling Uninstall(" .. tostring(moduleMatch) .. ")..");
			self.Actions:Install(moduleMatch, "true");
			--self["Methods"]["Install"](moduleMatch, "true");
		
		end
			
	end



	function	ZerkinzConfig.Methods:EventHandler(frameObject, command, event)
	
		local 	self		= _G[AddOnName];
		local	frameObject	= ( type(frameObject) == ('table' or 'userdata') and frameObject ) or (type(frameObject) == 'string' and ( ( type(self['Frames'][tostring(frameObject)]) == ('table' or 'userdata') and self['Frames'][tostring(frameObject)] ) or ( type(_G[tostring(frameObject)])==('table' or 'userdata') ) ) ) or false; -- frameName; _G[AddOnName]["Frames"]["Events"];
		local	frameName	= frameObject and frameObject:GetName();
		local	command		= command or "";
		--local	tempArray	= {};

		--if _G[AddOnNAme]["Events"]["States"] and type(_G[AddOnName]["Events"]["States"]) ~= "table" or not _G[AddOnName]["Events"]["States"] then 

			_G[AddOnName]["Events"]["States"] = _G[AddOnName]["Events"]["States"] or {};

		--end		
		
		if	type(self["Frames"]["Events"]) == "table"  and  type(self["EventFunctions"]) == 'table'  and  type(event) == "string"  and  stringMatch(event, self["EventFunctions"])  and  command  then

			if	type( self["Events"]["States"] ) == "table" then
			
				if	stringMatch("Unregister", command) then
				
					self["Frames"]["Events"]:UnregisterEvent(event);
					--self["Frames"]["Events"]:SetScript(event, nil);
					--_G[_G[AddOnName]["Frames"]["Events"]]:UnregisterEvent(event);
					--self["EventFunctions"][event] = nil;
					self["Events"]["States"][event]	= "0";			

					self:Print("General", "|CFFFF6611Unregister(", event, ";");

				elseif stringMatch("Register", command) then
					
					self["Frames"]["Events"]:RegisterEvent(event);
					--self["Frames"]["Events"]:RegisterEvent(event);
					--self.Events[event] = "1";
					self["Events"]["States"][event]	= "1";

					self:Print("General", "|CFF66FF11Register(", event, ";");

				elseif stringMatch("Toggle", command) then
				
					if	self["Events"]["States"][event] == nil or self["Events"]["States"][event] == "0" then
					
						self["Frames"]["Events"]:RegisterEvent(event);
						--_G[self["Frames"]["Events"]]:RegisterEvent(event);
						--self.Events[event] = "1";
						self["Events"]["States"][event]	= "1";
	
						self:Print("General", "|CFF66FF11Register(", event, ";");
					
					
					else

						self["Frames"]["Events"]:UnregisterEvent(event);
						--self["Frames"]["Events"]:SetScript(event, nil);
						--_G[self["Frames"]["Events"]]:UnregisterEvent(event);
						--self["EventFunctions"][event] = nil;
						self["Events"]["States"][event]	= "0";			
	
						self:Print("General", "|CFFFF6611Unregister(", event, ";");
					
					end
				
				end
				
				return true;
			
			end


		--[[ == END == [-] IF EVENT == "STRING" == [-]	 == ]]-->

		--[[ ============================================== ]]-->

		--[[ == NEW == [+] IF EVENT == "TABLE" == [+]	 == ]]-->
		

		elseif type(self["Frames"]["Events"]) == "table" and event and type(event) == "table" and type(command) == "string" then

			--	[+] NEW FOREACH LOOP [+]	--
			for k,v in pairs(event) do
				--tempArray[k] = v;
				
				if stringMatch("Unregister", command) then
					
					self["Frames"]["Events"]:UnregisterEvent(k);
					--self["Frames"]["Events"]:SetScript(k, nil);
					self["Events"]["States"][k]	= "0";
					event[k] = "0";
					--self["Frames"]["Events"]:UnregisterEvent(k);
					--self.Events[event] = "1";
					self:Print("General", "|CFFFF6611Unregister(", k, ";");

				elseif stringMatch("Register", command) then
					
					self["Frames"]["Events"]:RegisterEvent(k);
					self["Events"]["States"][k]	= "1";
					event[k] = "1";
					--self["Frames"]["Events"]:RegisterEvent(k);
					--self.Events[event] = "1";
					self:Print("General", "|CFF66FF11Register(", k, ";");	
		
				elseif	stringMatch("Toggle", command) then
					
						if	not self["Events"]["States"][k] or tostring(self["Events"]["States"][k]) == "0" then
						
							self["Frames"]["Events"]:RegisterEvent(k);
							self["Events"]["States"][k]	= "1";
							event[k] = "1";
							--self["Frames"]["Events"]:RegisterEvent(k);
							--self.Events[event] = "1";
		
							self:Print("General", "|CFF66FF11Register(", k, ";");
						
						else
						
							self["Frames"]["Events"]:UnregisterEvent(k);
							--self["Frames"]["Events"]:SetScript(k, nil);
							self["Events"]["States"][k]	= "0";
							event[k] = "0";
							--self["Frames"]["Events"]:UnregisterEvent(k);
							--self.Events[event] = "1";
		
							self:Print("General", "|CFFFF6611Unregister(", k, ";");
						
						end
					
					end

				end
			--	[-] END FOREACH LOOP [-]	--

			return true, event;
		
		--[[ =============================================== ]]-->
		--[[ == [-END-] == IF EVENT == "TABLE" == [-END-] == ]]-->
		
		else
		
			return false;
		
		end
		
		--[[ == [-END-]	1st LAYER VAR CHECKS	[-END-] == ]]-->
		--[[ ============================================= ]]-->
	
	end



	function ZerkinzConfig:InstantiateModule(moduleName)
		
		local moduleMatch;
		self:InstantiateCoreArrays("true");
		
		--[[ ZerkinzMethods = deprecated ..
		ZerkinzMethods = {};
		ZerkinzMethods["Install"]		= "Install";
		ZerkinzMethods["Restore"]		= "Restore";
		ZerkinzMethods["SavedSettings"]	= "SavedSettings";
		ZerkinzMethods["Update"]		= "Update";
		ZerkinzMethods["Support"]		= "Support";
		
		-- ZerkinzCVarModules = deprecated ..
		ZerkinzCVars = {};
		ZerkinzCVars["ActionCam"] = {};
		ZerkinzCVars["All"] = {};
		ZerkinzCVars["Graphics"] = {};
		ZerkinzCVars["Shadows"] = {};
		
	
		--self:arraysInstantiated = true;
		
		-- ZerkinzCVarModules = deprecated ..
		ZerkinzCVarModules = {};
		
		local i = 1;
		
		for k in pairs (self.Modules) do
			
			if type(k) == "table" then
					
				ZerkinzCVarModules[(k)] = i; 
					
				i = i + 1;
				
			end
			
		end	
		]]
	
		moduleMatch = stringMatch(moduleName, self.Modules);
		ZerkinzConfig:Print("General", 'InstantiateModule(', moduleMatch, ') // ', moduleName);
		moduleMatch = moduleMatch or moduleName;

		if not moduleName or not moduleMatch then
		
			return false;
	
		elseif	moduleMatch then
		
	
			if	moduleMatch == "ActionCam" or moduleMatch == "All" then

				--self.Modules["ActionCam"] = {};
				self.Modules["ActionCam"]["seenConfigurationWarnings"] = 1;
				self.Modules["ActionCam"]["CameraKeepCharacterCentered"] = 0;			-- Motion sickness control to keep character's head at center of screen to act as motion reference point. Can override other cvar settings.
				self.Modules["ActionCam"]["CameraReduceUnexpectedMovement"] = 0;		-- Motion sickness control to reduce camera movement without player input. Can override other cvar settings.
				self.Modules["ActionCam"]["ShakeStrengthCamera"] = 1;					-- Motion sickness control for how much effects can shake the camera
				self.Modules["ActionCam"]["ShakeStrengthUI"] = 1;						-- Motion sickness control for how much effects can shake in 2D UI
				self.Modules["ActionCam"]["test_cameraHeadMovementStrength"] = 50;
				self.Modules["ActionCam"]["test_cameraHeadMovementRangeScale"] = 30;
				self.Modules["ActionCam"]["test_cameraHeadMovementMovingStrength"] = 50;
				self.Modules["ActionCam"]["test_cameraHeadMovementStandingStrength"] = 50;
				self.Modules["ActionCam"]["test_cameraHeadMovementMovingDampRate"] = 50;
				self.Modules["ActionCam"]["test_cameraHeadMovementStandingDampRate"] = 50;
				self.Modules["ActionCam"]["test_cameraHeadMovementFirstPersonDampRate"] = 50;
				self.Modules["ActionCam"]["test_cameraHeadMovementDeadZone"] = 0.0;
				self.Modules["ActionCam"]["test_cameraDynamicPitch"] = 1;
				self.Modules["ActionCam"]["test_cameraDynamicPitchBaseFovPad"] = 1;
				self.Modules["ActionCam"]["test_cameraDynamicPitchBaseFovPadFlying"] = 0.75;
				self.Modules["ActionCam"]["test_cameraDynamicPitchBaseFovPadDownScale"] = 0.25;
				self.Modules["ActionCam"]["test_cameraDynamicPitchSmartPivotCutoffDist"] = 15;
				self.Modules["ActionCam"]["test_cameraOverShoulder"] = 0.5;
				self.Modules["ActionCam"]["test_cameraTargetFocusEnemyEnable"] = 1;
				self.Modules["ActionCam"]["test_cameraTargetFocusEnemyStrengthPitch"] = 0.125;
				self.Modules["ActionCam"]["test_cameraTargetFocusEnemyStrengthYaw"] = 0.25;
				self.Modules["ActionCam"]["test_cameraTargetFocusInteractEnable"] = 1;
				self.Modules["ActionCam"]["test_cameraTargetFocusInteractStrengthPitch"] = 0.25;
				self.Modules["ActionCam"]["test_cameraTargetFocusInteractStrengthYaw"] = 0.25;
				
			
			end



			if	moduleMatch == "SoftTarget" or moduleMatch == "All" then

				self.Modules["SoftTarget"]["SoftTargetFriend"] = 0;
				self.Modules["SoftTarget"]["SoftTargetInteract"] = 0;
				self.Modules["SoftTarget"]["SoftTargetEnemy"] = 3

				self.Modules["SoftTarget"]["SoftTargetForce"] = 0;
				self.Modules["SoftTarget"]["SoftTargetWithLocked"] = 2;
				self.Modules["SoftTarget"]["SoftTargetMatchLocked"] = 0;

				self.Modules["SoftTarget"]["SoftTargetEnemyArc"] = 1;
				self.Modules["SoftTarget"]["SoftTargetEnemyRange"] = 45.0;
				self.Modules["SoftTarget"]["SoftTargetIconEnemy"] = 1;
				self.Modules["SoftTarget"]["SoftTargetTooltipEnemy"] = 1;
				self.Modules["SoftTarget"]["SoftTargetTooltipDurationMs"] = 1500;
				self.Modules["SoftTarget"]["SoftTargetTooltipLocked"] = 0;
				
				self.Modules["SoftTarget"]["SoftTargetWorldtextSize"] = 24;
				self.Modules["SoftTarget"]["SoftTargetWorldtextNearScale"] = 2;
				self.Modules["SoftTarget"]["SoftTargetWorldtextNearDist"] = 0;
				self.Modules["SoftTarget"]["SoftTargetWorldtextFarDist"] = 40;
				
			end

			

			if	moduleMatch == "Shadows" or moduleMatch == "All" then
			
				
				--self.Modules["Shadows"] = {};
				self.Modules["Shadows"]["ssaoType"] = 2;
				self.Modules["Shadows"]["SSAO"] = 4;
				self.Modules["Shadows"]["shadowMode"] = 4;
				self.Modules["Shadows"]["shadowSoft"] = 1;
				self.Modules["Shadows"]["ResolvedSSAOType"] = 2;
				self.Modules["Shadows"]["graphicsSSAO"] = 5;
				self.Modules["Shadows"]["assaoAdaptiveQualityLimit"] = 1;
				self.Modules["Shadows"]["assaoBlurPassCount"] = 2;
			
				self.Modules["Shadows"]["assaoradius"] = 40;
				self.Modules["Shadows"]["assaoShadowPower"] = 0.75;
				self.Modules["Shadows"]["assaoShadowMult"] = 1.675;
				self.Modules["Shadows"]["assaoSharpness"] = 0.85;
				self.Modules["Shadows"]["assaoShadowClamp"] = 0.925;
				self.Modules["Shadows"]["assaoFadeOutFrom"] = 750;
				self.Modules["Shadows"]["assaoFadeOutTo"] = 1000;
			
				self.Modules["Shadows"]["ssaoMagicNormals"] = 1;			
				self.Modules["Shadows"]["assaoHorizonAngleThresh "] = 0.15;
				self.Modules["Shadows"]["ssaoMagicThresholdLow"] = 0;
				self.Modules["Shadows"]["ssaoMagicThresholdHigh"] = 135;
				self.Modules["Shadows"]["assaoDetailShadowStrength"] = 25;
			
				--[[
				self.Modules["Shadows"]["assaoDetailShadowStrength"] = 12.5;
				self.Modules["Shadows"]["assaoradius"] = 15;			
				self.Modules["Shadows"]["assaoShadowPower"] = 6.66;
				self.Modules["Shadows"]["assaoShadowMult"] = 0.275;
				self.Modules["Shadows"]["assaoSharpness"] = 0.85;
				self.Modules["Shadows"]["assaoShadowClamp"] = 0.25;			
				self.Modules["Shadows"]["assaoFadeOutFrom"] = 750;
				self.Modules["Shadows"]["assaoFadeOutTo"] = 1000;
				]]
			
			end
			
		
			if	moduleMatch == "Graphics" or moduleMatch == "All" then

				--self.Modules["Graphics"] = {};
				self.Modules["Graphics"]["graphicsViewDistance "] = 1;
				self.Modules["Graphics"]["horizonStart"] = 2000;
				self.Modules["Graphics"]["horizonclip"] = 4000;
				self.Modules["Graphics"]["farclip"] = 3000;
			
				self.Modules["Graphics"]["volumeFog"] = 0;
				self.Modules["Graphics"]["volumeFogLevel"] = 0;
				self.Modules["Graphics"]["volumeFogInterior"] = 0;	
				self.Modules["Graphics"]["weatherDensity"] = 3;
				self.Modules["Graphics"]["resampleQuality"] = 3;
				self.Modules["Graphics"]["resampleSharpness"] = 0.2;
				self.Modules["Graphics"]["resampleAlwaysSharpen"] = 1;
				
				--[[	LOD settings ]]--
				self.Modules["Graphics"]["wmoLodDist"] = 600;
				self.Modules["Graphics"]["terrainloddist"] = 600;
				self.Modules["Graphics"]["lodObjectFadeScale"] = 125;
				self.Modules["Graphics"]["lodObjectMinSize"] = 30;
				self.Modules["Graphics"]["lodObjectCullSize"] = 9;
				self.Modules["Graphics"]["lodObjectCullDist"] = 60;
				
			
				self.Modules["Graphics"]["entityShadowFadeScale"] = 100;
			
				self.Modules["Graphics"]["liquidDetail"] = 3;
				self.Modules["Graphics"]["reflectionMode"] = 3;
				self.Modules["Graphics"]["rippleDetail"] = 2;
			
			end
		
			
			if	moduleMatch == "All" then
			
				--ZerkinzConfig:Print("General", "Attempting to merge all modules into one, standby..");
				self.Modules["All"] = {};
			
				for k,v in pairs(self.Modules) do
				
					--DEBUG: ZerkinzConfig:Print("General", tostring(k), type(k), tostring(v), type(v));
				
					if k ~= "All" and type(v) == "table" then
						
						--DEBUG: ZerkinzConfig:Print("General", "Beginning to copy .. " .. tostring(k), tostring(v));
						self.Modules["All"] = table.copy(v, self.Modules.All);
						--copyTable(v, self.Modules["All"]);
					
					end
				
				end
			
			end
		
			
			return self.Modules[moduleMatch] or self.Modules or false;
			

			--[[
			local CharacterRealm		= GetRealmName();
			local CharacterName, Realm	= UnitName("player");
			local CharProfile			= ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName] or nil;
		
			if type(CharProfile) == "table" then
		
				for k,v in pairs(CharProfile) do
				
					if type(v) == "table" and stringMatch(k, moduleMatch) then
					
						for key,val in pairs(v) do
					
							self.Modules[k][key]	= val;				
						
						end
					
					end
				
				end
			
			end
		]]
		
		else
		
		return false;
		
		end
	
	end

	

	function ZerkinzConfig.Actions:ToggleFrame(frameName, displayState, ...)
		
		local self = _G[AddOnName];

		local displayState = string.lower(displayState) or nil;
		local methodObject = self["Frames"][frameName] or nil;
		local generalObject = _G[frameName] or nil;

		if methodObject == nil then
			ZerkinzConfig:Print("General", 'self["Frame"][', frameName, "] = nil;");
		else	
			
			if	displayState == "hide" or methodObject:IsShown() then
				ZerkinzConfig:Print("General", 'methodObject = ', methodObject, '; isShown() = ', methodObject:IsShown());
				methodObject:Hide();
			elseif displayState == "show" or not methodObject:IsShown() then
				ZerkinzConfig:Print("General", 'methodObject = ', methodObject, '; isShown() = ', methodObject:IsShown());
				methodObject:Show();
			end

		end


		if generalObject == nil then
			ZerkinzConfig:Print("General", "_G[", frameName, "] = nil;");
		else	
			
			if	displayState == "hide" or generalObject:IsShown() then
				ZerkinzConfig:Print("General", 'generalObject = ', generalObject, '; isShown() = ', generalObject:IsShown());
				generalObject:Hide();
			elseif	displayState == "show" or not generalObject:IsShown() then
				ZerkinzConfig:Print("General", 'generalObject = ', generalObject, '; isShown() = ', generalObject:IsShown());
				generalObject:Show();
			end

		end		

	end




	function ZerkinzConfig.Actions:NewFrame(frameName, parentName, ...)

		local	self 		= _G[AddOnName];

		local 	parentName 	= _G[parentName] or UIParent; -- or _G[UIParent] or _G['UIParent'];
		local	frameObject = self["Frames"][frameName]  or  _G[frameName];
		local	frameState	= ( frameObject or frameObject ~= nil ) and frameObject:IsShown();
		local	frameShown 	= ( frameObject ) and frameObject:IsShown();

		local	displayStates = {};
				displayStates['Show'] = 1;
				displayStates['Hide'] = 0;
		
		local 	displayState = "Show";
		local 	displayState = keyExists(displayState, displayStates)

		ZerkinzConfig:Print("General", self, displayState, parentName);
	

		ZerkinzConfig:Print("General", frameName, displayState, parentName);

		if	frameObject or self["Frames"][frameName] 	then 

			ZerkinzConfig:Print("General", ':: >>|cffFFFF00CreateWindow( |cffFFFFFF', tostring(frameName), ', ', tostring(displayState), ', ', tostring(parentName), '|r );');

			if 	frameState == true then
				self['Frames'][frameName]:Hide();
			else
				self['Frames'][frameName]:Show();
			end
		
			ZerkinzConfig:Print("General", 'Printing Info for :: self["Frames"][',frameName,'] : ', type(self['Frames'][frameName]), tostring(self['Frames'][frameName]));


		elseif	( not frameName or frameName == nil ) or ( type(frameName) ~= 'string' ) or ( type(frameName) == 'string' and ( frameName == ' ' or frameName == '' ) )	then
			
			ZerkinzConfig:Print("General", ':: |cffCC0000CreateWindow( |cffFFFFFF', tostring(frameName), ', ', tostring(displayState), ', ', tostring(parentName), '|r );');
			return false;
		
		elseif 	type(self['Frames']) == 'table' and not self["Frames"][frameName] 	then--not keyExists(frameName, self['Frames']) then

			ZerkinzConfig:Print("General", ':: |cff66FF11CreateWindow( |cffFFFFFF', tostring(frameName), ', ', tostring(displayState), ', ', tostring(parentName), '|r );');

			--local frame 		= self['Frames'][frameName]	or	_G[tostring(frameName)] or nil;
			--local frameObject	= self['Frames'][frameName] or _G[frameName] or nil; -- keyExists(frameName, self['Frames'])	or	_G[tostring(frameName)] or nil;
			
			
			if	( not frameObject or frameObject == nil ) and ( frameName ~= nil )	then
				
				local frameName_alt = tostring(frameName) .. "_alt";

				ZerkinzConfig:Print("General", '|cff66FF11the frame [', frameName, '] is free to create; attempting..!');

				self['Frames'][frameName] = CreateFrame('Frame', tostring(_G[AddOnName]).."_"..tostring(frameName), UIParent, InterfaceOptionsFramePanelContainer);
				--	self['Frames'][frameName]:Hide()
				self['Frames'][frameName]:SetFrameLevel(8) -- Health is 10, power is 5 or 15 by default; also changed by Threat.lua
				self['Frames'][frameName]:SetFrameStrata('FULLSCREEN_DIALOG'); --	self['Frames'][frameName]:SetFrameStrata("HIGH");
				self['Frames'][frameName]:SetAllPoints();

				self['Frames'][frameName]:SetWidth(600); -- Set these to whatever height/width is needed 
				self['Frames'][frameName]:SetHeight(400);				
				self['Frames'][frameName]:SetSize(750,75);
				--self['Frames'][frameName]:SetEnable(true);

				self['Frames'][frameName]:CreateBackdrop(nil, true, nil, nil, true);
				self['Frames'][frameName]:EnableMouse(true);
		
				self['Frames'][frameName]:Show();

				--[[ ------------------------------------------------------------- ]]

				_G[frameName_alt] = CreateFrame('Frame', nil, InterfaceOptionsFramePanelContainer);
								
				frameName_alt:SetFrameLevel(8) -- Health is 10, power is 5 or 15 by default; also changed by Threat.lua
				frameName_alt:SetFrameStrata('FULLSCREEN_DIALOG'); --	frameName_alt:SetFrameStrata("HIGH");
				frameName_alt:SetAllPoints();

				frameName_alt:SetWidth(600); -- Set these to whatever height/width is needed 
				frameName_alt:SetHeight(400);				
				frameName_alt:SetSize(750,75);
				frameName_alt:CreateBackdrop(nil, true, nil, nil, true);
				frameName_alt:EnableMouse(true);
		
				frameName_alt:Show();

				--self['Frames'][frameName].name = frameName;

				ZerkinzConfig:Print("General", 'Printing Info for :: self["Frames"][',frameName,'] : ', type(self['Frames'][frameName]), tostring(self['Frames'][frameName]));
				ZerkinzConfig:Print("General", 'Printing Info for :: self["Frames"][',frameName_alt,'] : ', type(_G[frameName_alt]), tostring(_G[frameName_alt]));

				--(frameName):Show()
				--(frameName):SetAllPoints()
				--(frameName).name = addonName

				--[[
				self['Frames'][tostring(frameName)] = CreateFrame(frameName,nil,UIParent);
				local frame = self['Frames'][tostring(frameName)] or _G[tostring(frameName)];
				frame:SetFrameStrata("BACKGROUND")
				frame:SetWidth(400) -- Set these to whatever height/width is needed 
				frame:SetHeight(400) -- for your Texture
				
				local texture = frame:CreateTexture(nil,"BACKGROUND")
				texture:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Factions.blp")
				texture:SetAllPoints(frame)
				frame.texture = texture;
				
				frame:SetPoint("CENTER",0,0)			
				frame:Show();]]
				
			end

		end

		local frameObject = self['Frames'][frameName];

		if not frameObject:IsShown() then
			self['Frames'][frameName]:Show();
		else
			self['Frames'][frameName]:Hide();
		end

		return self.Frames[frameName];

	end



	function ZerkinzConfig.Actions:PrintProfile(profileType,moduleName,args)

		local self = _G[AddOnName];
		
		local profileMatch = stringMatch("Account", profileType) or stringMatch("Character", profileType);
		local profileArray; 
		local Name = self.CharacterName;
		local Realm = self.CharacterRealm;

		if not Name or not Realm then
			
			ZerkinzConfig:Print("General", "|cffFF0000PrintProfile(" .. tostring(profileType) .. ") Failed => Character or Realm name not found (" .. tostring(Name) .. "-" .. tostring(Realm) .. ").")
			return false;

		end

		if profileMatch and profileMatch == "Account" and type(ZerkinzCfgAcct["Profiles"][Realm][Name]) == "table" then

			profileArray = ZerkinzCfgAcct["Profiles"][Realm][Name] or false;

		elseif profileMatch and profileMatch == "Character" and type(ZerkinzCfgChar["Profiles"][Realm][Name]) == "table" then

			profileArray = ZerkinzCfgChar["Profiles"][Realm][Name] or false;

		else

			profileArray = false;

		end



		if type(profileArray) == "table" then

			for k,v in pairs(profileArray) do

				if type(v) == "table" then

					ZerkinzConfig:Print("General", "[" .. tostring(k) .. "] is an array; printing its contents:")

					for key,val in pairs(v) do

						ZerkinzConfig:Print("General", "//---[|cff66FF11" .. tostring(key) .. "|r] => |cff1166FF" .. tostring(val) .. "|r;")
					
					end
				
				else

					ZerkinzConfig:Print("General", "//---[|cff66FF11" .. tostring(key) .. "|r] => |cff1166FF" .. tostring(val) .. "|r;")

				end

			end

		end

		ZerkinzConfig:Print("General", "|cffFFFF00//|r |cff66FF11PrintProfile-> moduleName, args = ", tostring(moduleName), tostring(args));
		
		moduleMatch_acct = stringMatch(moduleName, ZerkinzCfgAcct["activated_modules"]);
		moduleMatch_char = stringMatch(moduleName, ZerkinzCfgChar["activated_modules"]);	
		
		self:PrintNestedArrays(profileArray, "k,v");

		--[[
		if	not moduleName then 
		
			ZerkinzConfig:Print("General", "|cffFFFF00//|r |cff66FF11Printing Character Profile For [|cffFFFFFF" .. moduleMatch_char .. "|r]|r: ");
			self:printNestedArrays(ZerkinzCfgChar, "k,v");
		
		else
		
		]]--

		--[[
			ZerkinzConfig:Print("General", type(ZerkinzCfgAcct["activated_modules"][moduleMatch_char]));
			ZerkinzConfig:Print("General", type(ZerkinzCfgAcct["activated_modules"][moduleMatch_acct]));

			if moduleMatch_acct and type(ZerkinzCfgAcct["activated_modules"][moduleMatch_acct]) == "table" then
				
				self:printNestedArrays(ZerkinzCfgAcct[activated_modules][moduleMatch_acct], "k,v");
			
			end
		
			if moduleMatch_char and type(ZerkinzCfgChar["activated_modules"][moduleMatch]) == "table" then
				
				self:printNestedArrays(ZerkinzCfgChar[activated_modules][moduleMatch_char], "k,v");
			
			end
		]]
		--end
	
	end



	function ZerkinzConfig.Actions:SaveModule(moduleName,args)
		
		local self = _G[AddOnName];
	
		local CharacterName, CharacterRealm = UnitName("player");
		local 				 CharacterRealm = GetRealmName();

	
		if not moduleName then
			moduleName = "All";
		end

		--ZerkinzConfig:Print("General", CharacterName, "-", CharacterRealm);

		--[[ Deprecated Unique Global Array Profile Structure ]]--
		ZerkinzCfgAcct["Profiles"]									= 	ZerkinzCfgAcct["Profiles"] or {};
		ZerkinzCfgAcct["Profiles"][CharacterRealm]					=	ZerkinzCfgAcct["Profiles"][CharacterRealm] or {};
		ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName] or {};

		ZerkinzCfgChar["Profiles"]									= 	ZerkinzCfgChar["Profiles"] or {};
		ZerkinzCfgChar["Profiles"][CharacterRealm]					=	ZerkinzCfgChar["Profiles"][CharacterRealm] or {};
		ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName] or {};	

		--[[ Object-Oriented Profiles Structure ]]--
		
		ZerkinzConfig["Profiles"]									= 	ZerkinzConfig["Profiles"] or {};
		ZerkinzConfig["Profiles"]["Account"]						= 	ZerkinzConfig["Profiles"]["Account"] or {};
		ZerkinzConfig["Profiles"][CharacterRealm]					=	ZerkinzConfig["Profiles"][CharacterRealm] or {};
		ZerkinzConfig["Profiles"][CharacterRealm][CharacterName]	=	ZerkinzConfig["Profiles"][CharacterRealm][CharacterName] or {};

		--self:recursivePrint(ZerkinzCfgAcct);

		ZerkinzConfig.Profiles.Account = ZerkinzConfig["Profiles"]["Account"];
		ZerkinzConfig.Profiles.Character = ZerkinzConfig["Profiles"][CharacterRealm][CharacterName];
		ZerkinzConfig.Profiles.Active = ZerkinzConfig.Profiles.Active or nil;
		
		if	( type(ZerkinzConfig.Profiles.Active) == 'table' and ZerkinzConfig.Profiles.Active == ZerkinzConfig.Profiles.Account ) then

			ZerkinzConfig.Profiles.Active = ZerkinzConfig.Profiles.Account;

		elseif	( not ZerkinzConfig.Profiles.Active ) or ( type(ZerkinzConfig.Profiles.Active) == 'table' and ZerkinzConfig.Profiles.Active == ZerkinzConfig.Profiles.Character ) then
			
			ZerkinzConfig.Profiles.Active = ZerkinzConfig.Profiles.Character;
			ZerkinzConfig.Profiles.Active = ZerkinzConfig.Profiles.Character; 

		end
				
		--self:recursivePrint(ZerkinzCfgChar);
	
		local accountTable = {};
		local characterTable = {};
	
		--self:InstantiateModule(moduleName);
	
	
		self:recursivePrint(self.Modules);
	
		if type(ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName]) == "table" and type(ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName]) == "table" then
	
			for k,v in pairs(self.Modules) do
			
				if type(v) == "table" then
				
					local arraySize = arrayKeys(v);
					ZerkinzConfig:Print("General", "|cffFFFF00", k, " ==> ", tostring(arraySize));
				
				end

				if type(v) == "table" and tonumber(arrayKeys(v)) >= 1 and k ~= "All" then

					ZerkinzConfig:Print("General", "|cffFFFF00|-[SavedVariables] -> [Profiles] -> [" .. CharacterRealm .. "] -> [" .. CharacterName .. "] -> [" .. tostring(k) .. "]:");				
					ZerkinzConfig:Print("General", "==============================");
				
					ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName][k] = {};
					ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName][k] = {};			
					ZerkinzConfig.Profiles.Active[k] = {};

					for key,val in pairs(v) do				

						local currentCVal			= GetCVar("" .. key .. "") or GetCVar(key) or nil;

						ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName][k][key]	= currentCVal;
						--ZerkinzCfgChar.Profiles.CharacterRealm.CharacterName.k.key	= currentCVal;
						ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName][k][key]	= currentCVal;
						ZerkinzConfig.Profiles.Active[k][key] = currentCVal;

						ZerkinzConfig:Print("General", "|cffFF9900|----[" .. tostring(k) .. "] => [" .. tostring(key) .. "] = '" .. tostring(currentCVal) .. "';|r");
					
						--ZerkinzCfgAcct["Profiles"][k] = CVarVal;
						--ZerkinzCfgChar["Profiles"][k] = CVarVal;			

					end -- nested for

				elseif type(v) == "table" and type(ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName][k]) == "table" and table.getn(ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName][k]) < 1 then
				
					ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName][k]	= nil;
					ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName][k]	= nil;
					ZerkinzConfig.Profiles.Active[k]									= nil;

				else	

					local currentCVal	= GetCVar("" .. k .. "") or GetCVar(k) or nil;

					ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName][k]	= currentCVal;
					ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName][k]	= currentCVal;
					ZerkinzConfig.Profiles.Active[k]									= currentCVal;

				end -- if key == table


			end -- base for
	
			--ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName]	=	accountTable;
			--ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName]	=	characterTable;

			self:recursivePrint(ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName]);
			--self:recursivePrint(ZerkinzCfgChar["Profiles"][CharacterRealm][CharacterName]);

		
			--[[
			for k,v in pairs(ZerkinzCfgAcct["Profiles"][CharacterRealm][CharacterName]) do

				ZerkinzConfig:Print("General", "|-[",tostring(k),"] => ", tostring(v));

				if type(v) == "table" then

					for key,val in pairs(v) do

						ZerkinzConfig:Print("General", "|----[",tostring(key),"] => ", tostring(val));

					end

				end

			end
			]]
		
		else
		
			ZerkinzConfig:Print("General", "SaveModule('"..tostring(moduleName).."') could not be completed due to the required SavedVariable arrays not existing to hold the requested data.");
		
		end
	
	end



	function ZerkinzConfig.Actions:LoadSettings(...)

		local	self = _G[AddOnName];
		local 	actionName = 'LoadSettings';

		local	command_parameters		= NameArgs({...}, 'profile_type', 'profile_subdir_path', 'parameter1', 'parameter2', 'parameter3', 'parameter4');
		local	profile_type, profile_subdir_path, parameter1, parameter2, parameter3, parameter4 = ...;		

		local	RealmCharacterToken, characters_realm, characters_name = UnitID_Token('player', '%s.%s', 'realm', 'character'); --CharacterRealmID('realm', 'name', '%s.%s');
		local 	realm_character = RealmCharacterToken or nil;
		
		local 	SetCVar_errors;
		local 	SetCVar_attempts;
		local 	SetCVar_succeeds;

		local 	profile_types = { 
					["character"]	= "Character";
					["account"] 	= "Account";
				};

		local	profile_root_paths = {};
				profile_root_paths['account']	= '__ZerkinzConfig_Account';
				profile_root_paths['character']	= '__ZerkinzConfig_Character';

		local 	default_profile_path	= string.format('%s.%s.%s.%s', (keyMatch('character', profile_root_paths, 'v')), characters_realm, characters_name, 'ActiveProfile');
		local	default_profile 		= is_table(rawgetval(default_profile_path)) or nil;
	
		local	profile_type			= ( is_string(profile_type) and stringMatch(string.lower(profile_type), profile_types, 'v') ) or 'Character';
		local	profile_root_path 		= ( type(profile_type) == 'string' and stringMatch(profile_type, profile_root_paths, 'v') ) or nil; --string.lower(profile_type) or 'character';


		if	stringMatch('Character', profile_type)	and type(default_profile) == 'table' then
			
			self['Profiles'].LoadedProfilePath = is_string(default_profile_path) or nil;

			self:Print('General', '( ', ColorText('66FF11', 'LoadSettings'), ' ): preparing to inject profile @ (', ColorText('FFFF00', default_profile_path), ') : ...');

			local	injectStatus, SetCVar_succeeds, SetCVar_errors = self:InjectSettings(default_profile, default_profile_path);

			self:Print('General', ColorText('66FF11', 'LoadSettings'), ' from  (', ColorText('FFFF00', default_profile_path), ') : ', ( injectStatus and ColorText('66FF11', injectStatus) ) or ColorText('FF0000', injectStatus), ' | ', ColorText('66FF11', 'SetCVar Count'), ' = ', (SetCVar_succeeds or 0), '; ', ColorText('FF0000', 'SetCVar Fails'), ' = ', ( SetCVar_errors or 0 ), ';');

			if	injectStatus	then
				return true;
			end

		end

		local 	seperator_count, result_1, result_2;

		if	not profile_subdir_path or profile_subdir_path == (' ' or '  ' or '   ' or  nil) then
			
			--profile_subdir_path, result_1, result_2, seperator_count  = Format_CharacterID(profile_subdir_path, '.');
			--profile_subdir_path	= (type(profile_subdir_path) == 'string' and ''..tostring(profile_subdir_path)..'.ActiveProfile') or tostring(characters_realm..'.'..characters_name..'.ActiveProfile');
			profile_subdir_path = realm_character..'.ActiveProfile';
			
		elseif 	type(profile_subdir_path) == 'string' then

			--profile_subdir_path, result_1, result_2, seperator_count  = Format_CharacterID(profile_subdir_path, '.');
			profile_subdir_path	= tostring(characters_realm..'.'..characters_name..'.ActiveProfile');
			--(type(profile_subdir_path) == 'string' and ''..tostring(profile_subdir_path)..'.ActiveProfile') or tostring(characters_realm..'.'..characters_name..'.ActiveProfile');

		end

		--local 	profile_subdir_path = ( type(profile_subdir_path) == 'string' and profile_subdir_path ~= ('' or 'nil') and profile_subdir_path ) or ( type(realm_character) == 'string' and tostring(realm_character)..'.ActiveProfile' );
		
		 
		local	profile_account_tablename 	= stringMatch('account', profile_root_paths, 'v') or '__ZerkinzConfig_Account';
		local 	profile_character_tablename = stringMatch('account', profile_root_paths, 'v') or '__ZerkinzConfig_Character';
		local 	profile_selected_tablename	= stringMatch(profile_type, profile_root_paths, 'v') or profile_character_tablename;

		--local 	profile_root_path = (profile_root_path and stringMatch(profile_root_path, profile_root_paths, 'v') ) or profile_character_tablename or profile_root_paths['character'] or nil; --rawget(profile_root_paths, profile_root_path)) or nil;	
		--local	profile_subdir_path = (profile_subdir_path and rawget(profile_root_paths, profile_subdir_path));

		local	selected_profile_path;
		local	selected_profile;
		
		if	type(profile_root_path) == 'string' and type(profile_subdir_path) == 'string' or type(default_profile_path) == 'string' then

			selected_profile_path	= (  tostring(profile_root_path).."."..tostring(profile_subdir_path)) or (default_profile_path and tostring(default_profile_path));
			selected_profile_path	= (  type( rawgetval(default_profile_path) ) == 'table' and tostring(default_profile_path)  ) or (  type( rawgetval(selected_profile_path) ) == 'table' and tostring(profile_root_path)  ) or selected_profile_path or nil;
			selected_profile		= (  type( rawgetval(selected_profile_path) ) == 'table' and rawgetval(profile_root_path)  ) or nil;
			
			--default_profile 		= (  type( rawgetval(default_profile_path) ) == 'table' and rawgetval(default_profile_path)  )
			selected_profile 		= ( is_table(selected_profile) or is_table(default_profile) ) or nil;

			local	injectStatus, SetCVar_succeeds, SetCVar_errors = self:InjectSettings(selected_profile);
			
			self:Print('General', selected_profile_path, injectStatus, SetCVar_succeeds, SetCVar_errors)
			self:Print('ZerkinzConsole', selected_profile_path, injectStatus, SetCVar_succeeds, SetCVar_errors)
			
			return injectStatus, SetCVar_succeeds, SetCVar_errors;

		end

	end



	function ZerkinzConfig:InjectSettings(profile, profile_path)

		local self 					=	is_table(_G[AddOnName]) or is_table(_G.ZerkinzConfig);
		local selected_profile_path = 	( is_string(profile_path) and profile_path ) or ( is_string(profile) and profile );
		local selected_profile		=	( is_table(profile) and profile )  or ( is_string(profile) and is_table( rawgetval(profile) ) ) or ( is_string(profile_path) and is_table( rawgetval(profile_path) ) ) or nil;

		local actionName = 'LoadSettings';
		local SetCVar_errors;
		local SetCVar_attempts;
		local SetCVar_succeeds;
		
		local SetCVar_skips;
		local skipped_CVars = {};

		local C_CVar = _G.C_CVar;


		if 	type(selected_profile) ~= 'table' then
			return false, selected_profile, selected_profile_path;
		
		elseif	type(selected_profile) == 'table' then

			if	is_string(selected_profile_path) then
				self['Profiles'].LoadedProfilePath = selected_profile_path;
			end

			SetCVar_errors = 0;

			for k,v in pairs(selected_profile) do

				local	blacklisted 					= is_blacklisted(k);
				
				-- Skip this cycle if blacklisted ..
				if	type(blacklisted) == 'boolean' and blacklisted == true then	

					table.insert(skipped_CVars, k);
					SetCVar_skips 						= ( SetCVar_skips or 0 ) + 1;

				else
				-- Execute this cycle if NOT blacklisted ..	
					local	SetCVar_return				= ( ( C_CVar.SetCVar(tostring(k), tostring(v)) ) or SetCVar(tostring(k), tostring(v)) ) or false;
							SetCVar_attempts 			= ( SetCVar_attempts or 0 ) + 1;

					if	SetCVar_return	==	false    then

								SetCVar_errors			=	( SetCVar_errors or 0 ) + 1;
						local	SetCVar_errors_text		= 	tostring("[-" .. ColorText("FF0000", tostring(SetCVar_errors)) .. "];");

						self:Print( "General", "" .. tostring(actionName or "") .. ":" .. ColorText("FF0000", "SetCVar") .. "( " .. ColorText( "FF0000", (tostring(k) .. ' |cffFFFFFF=|r ' .. tostring(v)) ) .. "; " .. SetCVar_errors_text .. " );");

					else

								SetCVar_succeeds 		=	( SetCVar_succeeds or 0 ) + 1;
						local	SetCVar_succeeds_text	= 	tostring("[+" .. ColorText("66FF11", tostring(SetCVar_succeeds)) .. "];");

						self:Print( "General", "" .. tostring(actionName or "") .. ":" .. ColorText("66FF11", "SetCVar") .. "( " .. ColorText( "66FF11", (tostring(k) .. ' |cffFFFFFF=|r ' .. tostring(v)) ) .. "; " .. SetCVar_succeeds_text .. " );");

					end
				
				end -- is_blacklisted 
				
			end

			self:Print('General', ColorText('66FF11', 'LoadSettings'), ' from  (', ColorText('FFFF00', default_profile_path), ') : ', ( injectStatus and ColorText('66FF11', injectStatus) ) or ColorText('FF0000', injectStatus), ' | ', ColorText('66FF11', 'SetCVar Count'), ' = ', (SetCVar_succeeds or 0), '; ', ColorText('FF0000', 'SetCVar Fails'), ' = ', ( SetCVar_errors or 0 ), ';');
			self:Print( "General",	actionName, " finished injecting [", SetCVar_attempts, "] CVars from [", ColorText( "66FF11", selected_profile_path), "]: ", ColorText( "66FF11", "Injected |cffFFFFFF=|r "..tostring(SetCVar_succeeds) ), "; ", ColorText("FF0000", "Errors |cffFFFFFF=|r "..tostring(SetCVar_errors)), ";" );
			
			self:AcceptPopUp("Accept", "Disable");

			return true, (SetCVar_succeeds or 0), (SetCVar_errors or 0), (SetCVar_skips or 0), skipped_CVars;

		else
			
			return false;

		end
	
	end
	
	


	function ZerkinzConfig.Actions:SaveSettings( ... )

		local	self = _G[AddOnName];
				self:Print("General", "SaveSettings( " .. tostring('['..((select("#", ...)) or 'no args supplied')..']') .. ") was called.. we're all hands on deck.");

		local 	profileTypes			= { ['account'] = 'Account', ['character'] = 'Character' };
		local 	profileType_default		= profileTypes['character'] or 'Character';			

		local	profileType, parameter1, parameter2, parameter3, parameter4 = ...;			
				profileType				= (type(profileType) == 'string' and string.lower(profileType)) or 'character';
				profileType 			= stringMatch((profileType or parameter1), profileTypes, 'v') or profileType_default;

		local	args_count = select("#", ...) or #{...}; --and select("#", ...) > 0 and select("#", ...)) or (... and #{...} > 0 and #{...}) or 0;
		local	realm_character_string, characters_realm, characters_name = CharacterRealmID('realm', 'name', '%s.%s');
		--local profileType, parameter1, parameter2, parameter3, parameter4, parameter5 = self:GetArgs(args, 6);



		--if 	type(args_count) == 'number' and args_count > 0 then
		print("|cff66FF11>>> ", realm_character_string, characters_realm, characters_name)
		self:Print("General", args_count, profileType, parameter1, parameter2, parameter3, parameter4, realm_character_string, characters_realm, characters_name );
		self:Print("General", "SaveSettings( args =", select(1, ...), "; )");

		--for k,v in pairs({...}) do
			--self:Print("General", k, ' => ', v, ";");
		--end
		local profileType					= stringMatch(profileType, profileTypes, 'v') or profileType_default; --rawget(profileTypes, string.lower(profileType)) or profileTypes[string.lower(profileType)]; --stringMatch( (type(profileType) == 'string' and string.lower(profileType)), profileTypes, 'v');-- or profileType_default;
		local profile_path_format			= '__ZerkinzConfig_%s.%s.%s';
		--local realm_character	 			= (type(realm_character_string) == 'string' and realm_character_string) or (type(characters_realm) == 'string' and type(characters_name) == 'string' and string.format("%s.%s", characters_realm, characters_name));
		local realm_character 				= realm_character_string;
		local formatted_profile_path 		= string.format(profile_path_format, profileType, characters_realm, characters_name);
		local formatted_account_path		= string.format(profile_path_format, 'Account', characters_realm, characters_name); --realm_character_string or realm_character ); --characters_realm, characters_name);
		local formatted_character_path 		= string.format(profile_path_format, 'Character', characters_realm, characters_name); --realm_character_string or realm_character ); --characters_realm, characters_name);

		self:Print( "General", formatted_profile_path, profileType, realm_character, realm_character_string, characters_realm, ".", characters_name);
		print(formatted_profile_path, profileType, realm_character, realm_character_string, characters_realm, ".", characters_name);

		--local command_parameters			= NameArgs({...}, 'profileType', 'parameter1', 'parameter2', 'parameter3', 'parameter4');

		--[[
		self.__Account		=	( type(self.__Account) == 'table' and self.__Account ) or {};
		self.__Character	= 	( type(self.__Character) == 'table' and self.__Character ) or {};
		self.__Character['BackupProfile'] = self.__Character['Profile'] or nil;
		self.__Character['Profile'] = {};
		]]
		--local ConsoleInputs =  ConsoleGetAllCommands();
		--local	ConsoleCVars = {};
		
		local	PreviousProfile = ( is_table( rawgetval(formatted_character_path..'.ActiveProfile') ) ) or false;
		local	NewProfile 		= rawsetval(formatted_character_path..'.ActiveProfile', {});
				NewProfile 		= is_table( rawgetval(formatted_character_path..'.ActiveProfile') ) or false;
		
		local 	SavedCVars 		= 0;

		for command_key,command_table in pairs(ConsoleGetAllCommands()) do
			
			if	Console_GetType(command_table['commandType']) == 'CVar' then

				local CVar_Name = command_table['command'];
				local CVar_Type = command_table['commandType'];
				local CVar_Default = C_CVar.GetCVarDefault(CVar_Name) or GetCVarDefault(CVar_Name);
				local CVar_Value = C_CVar.GetCVar(CVar_Name) or GetCVar(CVar_Name);
				
				if	CVar_Default ~= CVar_Value then 

					SavedCVars = ( SavedCVars or 0 ) + 1;
					NewProfile[CVar_Name] = CVar_Value;
					local info = {	['r'] = 1.0, ['g'] = 0.666, ['b'] = 0, ['id'] = 8 };
					self:Print( "General", "SaveSettings( [ SavedCVars ] = " .. tostring(SavedCVars) .. ";  [ " .. tostring(CVar_Name) .. " ] = '" .. tostring(CVar_Value) .. "'; );" );
					--self.__Character['Profile'][CVar_Name] = CVar_Value;			

				end

				--ConsoleCVars[''..command_table['command']..''] = { default_value = CVarDefault, current_value = CVarVal, category = command_table['category'] };

			end
			
		end

		self:Print("General", 'Attempting to SaveSettings( to: "'..ColorText('66FF11', formatted_profile_path)..'"; );');

		print("|cff66FF11>>", args_count, profileType, parameter1, parameter2, parameter3, parameter4, realm_character_string, characters_realm, characters_name );

		local selected_profile_backup;
		local account_profile_backup;
		local character_profile_backup; 

		if 	type(NewProfile) == 'table' and is_number(SavedCVars) and tonumber(SavedCVars) > 0 then

			--BackupProfiles = { [profileType]	= rawgetval(formatted_profile_path..'.ActiveProfile') } or nil;
			--BackupProfiles = { ['Account']		= rawgetval(formatted_account_path..'.ActiveProfile') } or nil;
			--BackupProfiles = { ['Character']	= rawgetval(formatted_character_path..'.ActiveProfile') } or nil;
			--account_profile_backup		= rawgetval(formatted_account_path..'.ActiveProfile') or nil;
			--character_profile_backup	= rawgetval(formatted_character_path..'.ActiveProfile') or nil; 
						

			if	( type(formatted_profile_path) == 'string' and type(characters_name) == 'string' and type(characters_realm) == 'string' ) or ( type(realm_character) == 'string' and realm_character ~= ('' or 'nil') ) then
				
				self:Print("General", 'Starting to SaveSettings to: '..ColorText('66FF11', formatted_profile_path)..'"; );');
				print("|cff66FF11>>", args_count, profileType, parameter1, parameter2, parameter3, parameter4, realm_character_string, characters_realm, characters_name );
				
				--[[ Backup Pre-Existig ActiveProfile Arrays if they exist before overwriting them with the user's new array of settings : .. ]]--
				rawsetval( formatted_profile_path..'.BackupProfile',	(	( is_table(PreviousProfile) and PreviousProfile ) or ( rawgetval(formatted_profile_path..'.ActiveProfile') )		or	rawgetval(formatted_profile_path..'.BackupProfile')		)	);
				rawsetval( formatted_account_path..'.BackupProfile',	(	( is_table(PreviousProfile) and PreviousProfile ) or ( rawgetval(formatted_account_path..'.ActiveProfile') )		or	rawgetval(formatted_account_path..'.BackupProfile')		)	);
				rawsetval( formatted_character_path..'.BackupProfile',	(	( is_table(PreviousProfile) and PreviousProfile ) or ( rawgetval(formatted_character_path..'.ActiveProfile') )		or	rawgetval(formatted_character_path..'.BackupProfile')	)	);				
				
				local SaveSettings_returns = {};

				--[[ Proceed with SaveSettings() as user requested: .. ]]--
				SaveSettings_returns[1] = rawsetval( formatted_profile_path..'.ActiveProfile',	NewProfile );
				SaveSettings_returns[2] = rawsetval( formatted_account_path..'.ActiveProfile',	NewProfile );
				SaveSettings_returns[3] = rawsetval( formatted_character_path..'.ActiveProfile', NewProfile );

				--rawsetval( '__ZerkinzConfig_Account.'..realm_character..'.ActiveProfile', NewProfile );
				--rawsetval( '__ZerkinzConfig_Account.'..realm_character..'.ActiveProfile', NewProfile );
				--rawsetval( '__ZerkinzConfig_Character.'..realm_character..'.ActiveProfile', NewProfile );

				for k,v in ipairs(SaveSettings_returns) do 
					self:Print("General", 'SaveSettings( '..ColorText('66FF11', 'Successfully saved to Profile Slot [|cffFFFFFF'..k..'|r]!')..' );');
				end

				self:Print( "General",	"SaveSettings( " .. ColorText("66FF11", "[SavedCVars]  = " .. tostring(SavedCVars) .. ";") .. " );");

				return true;

			else
				
				self:Print( "General", "SaveSettings( " .. ColorText("FF0000", "SOMETHING WENT WRONG; ERROR. ERROR! BEEP, BOOP, BOOP..")   .. " )");
				return false;

			end

		end

		--[[
		if	type(__ZerkinzConfig_Character) == 'table' then

			print_r(__ZerkinzConfig_Character, 'ZerkinzConfig.__Character.Profile');
			self:Print('General', "Successfully saved this character's settings!"); 
			
			return true;

		else
			
			self:Print('General', "There was an "..ColorText("FF0000", "ERROR").." saving character's settings!"); 
			return false;

		end
		]]

		--[[

		for CVar_Name,CVar_Table in pairs(ConsoleCVars) do
		
			if CVar_Name['default_value'] ~= CVar_Name['current_value'] then



			end

		end
		]]

	end




	function ZerkinzConfig.Actions:SaveProfile(...)
		
		local _self = self;
		local self = _G[AddOnName];

		local moduleName, profileType, parameter1, parameter2, parameter3 = ...;
		local command_parameters	= NameArgs({...}, 'moduleName', 'profileType', 'parameter1', 'parameter2', 'parameter3');
		local moduleName = stringMatch((is_string(moduleName) or 'All'), self['Modules']);
		
		self:InstantiateModule(moduleName);

		for k,v in pairs(command_parameters) do
		
			ZerkinzConfig:Print('General', _self, self, k, ' = ', v);

		end


		ZerkinzConfig:Print("General", _self, moduleName, args);
	
		--self:InstantiateModule(moduleName);
	
		ZerkinzConfig:Print("General", "Printing SavedVar Parent Array:")
		self:printArray(ZerkinzCfgAcct);
		self:printArray(ZerkinzCfgChar);
	
		ZerkinzConfig:Print("General", "Printing SavedProfile Array:")
		self:printNestedArrays(ZerkinzCfgAcct, "k,v");
		self:printNestedArrays(ZerkinzCfgChar, "k,v");
		
	
		for k,v in pairs(self['__args'] or params or self['command_parameters']) do
		
			ZerkinzConfig:Print("General", "[", k, "] => ", v, "; ");
		
		end
	
		if not ZerkinzCfgAcct["SavedProfile"] or ZerkinzCfgAcct["SavedProfile"] and type(ZerkinzCfgAcct["SavedProfile"]) ~= "table" then
		
			ZerkinzCfgAcct["SavedProfile"] = {};
		
		end
	
		if not ZerkinzCfgChar["SavedProfile"] or ZerkinzCfgChar["SavedProfile"] and type(ZerkinzCfgChar["SavedProfile"]) ~= "table" then
		
			ZerkinzCfgChar["SavedProfile"] = {};
		
		end
	
		
		--ZerkinzCfgAcct["SavedProfile"] = ZerkinzCfgAcct["SavedProfile"] or {};
		--ZerkinzCfgChar["SavedPaarofile"] = ZerkinzCfgChar["SavedProfile"] or {};
	
		if 	type(self.Modules[moduleName]) == 'table' then

			self:printArray(self.Modules[moduleName]);
		
			for k,v in pairs(self.Modules[moduleName]) do
			
				local CVarVal = GetCVar("" .. k .. "") or GetCVar(k) or nil;

				ZerkinzCfgAcct["SavedProfile"][k] = CVarVal;
				ZerkinzCfgChar["SavedProfile"][k] = CVarVal;
			
			end
			
		end
	
		ZerkinzCfgAcct["SavedProfile_Enabled"] = 1;
		ZerkinzCfgChar["SavedProfile_Enabled"] = 1;
	
		self:printArray(ZerkinzCfgAcct["SavedProfile"]);
		self:printArray(ZerkinzCfgChar["SavedProfile"]);

		return moduleName, true;
	
	
	end




	function ZerkinzConfig.Actions:UpdateDefaults(moduleName)
	
		local self = _G[AddOnName];
		
		if moduleMatch == "All" then
			
		
			for k,v in pairs(ZerkinzCfgAcct) do
				
				
				if type(v) == "table" then

				
					ZerkinzConfig:Print("General", "|-|cff66FF11", tostring(k), " => ", tostring(v), ";|r");		
					
					for	key,val in pairs(v) do

						ZerkinzConfig:Print("General", "|---|cffAAFF44", tostring(key), " => ", tostring(val), ";|r");

					end

				
				else
					
					ZerkinzConfig:Print("General", "|-|cffFF9900", tostring(k), " => ", tostring(v), ";|r");
					
				end

			end
			
		
		elseif	self.Modules[moduleMatch] then
			
			if	type(ZerkinzCfgAcct[moduleMatch]) == "table" then
				
				for k,v in pairs(ZerkinzCfgAcct[moduleMatch]) do


					if	type(v) == "table" then

						ZerkinzConfig:Print("General", "|-|cff66FF11", tostring(k), " => ", tostring(v), ";|r");		

						for	key,val in pairs(v) do

							ZerkinzConfig:Print("General", "|---|cffAAFF44", tostring(key), " => ", tostring(val), ";|r");

						end

					else

						ZerkinzConfig:Print("General", "|-|cffFF9900", tostring(k), " => ", tostring(v), ";|r");

					end

				end				
				
			printArray(ZerkinzCfgAcct[moduleMatch]);
			self:PrintTableKeys(ZerkinzCfgAcct[moduleMatch], "k,v");
				
			end -- end if moduleMatch == table
			
		end -- end if moduleMatch == "All" or individual moduleMatch
		
				self:printTableKeys(ZerkinzCfgAcct, "k,v");
				self:printTableKeys(ZerkinzCfgAcct["activated_modules"], "k,v");	
	
	
	end


	function ZerkinzConfig.Actions:ActiveProfile(moduleName, ...)

		local _self		= self;
		local self		= _[AddOnName];
		local active 	= self['Profiles']['ActiveProfile'];

		ZerkinzConfig:Print("General", ""..(_self and tostring(_self:GetName())).." ( "..(active and tostring(active)).." );"); 

		return active or false;

	end

	function ZerkinzConfig.Actions:BackupProfile(moduleName, backupType)
		
		local self = _G[AddOnName];
		local AcctBackup = {};
		local CharBackup = {};
		local errors = 0;
	
		self:InstantiateModule("All");
	
	
		if not moduleName then 
		
			ZerkinzConfig:Print("General", "Failed to save initial values: a module name was not supplied.");
			return false;
		
		
		else
			
			moduleMatch = stringMatch(moduleName, self.Modules);			
	
		
			if not moduleMatch then
				
				ZerkinzConfig:Print("General", "BackupProfile() => " .. tostring(moduleName) .. " is not a valid module.");
				return false;
			
			
			elseif self.Modules[moduleMatch] then
			
				self:InstantiateModule(moduleMatch);
			
			
				for key,val in pairs(self.Modules) do
				
					if type(val) == "table" then
						
						ZerkinzConfig:Print("General", "|cffFFFF66" .. tostring(self) .. "()|r :: Saving CVar values relevant to the [ '|cffFFFFFF" .. tostring(key) .. "|r' ] module, standby..");
					
						AcctBackup[key] = AcctBackup[key] or {};
						CharBackup[key] = CharBackup[key] or {};
					
					
						for key2,val2 in pairs (val) do
						
							local CVarVal = GetCVar("" .. key2 .. "") or GetCVar(key2) or nil;
							--UserCVars[key][key2] = CVarVal;
							--
							if type(AcctBackup) == "table" then
								AcctBackup[key][key2] = CVarVal;
							end
							if type(CharBackup) == "table" then
								CharBackup[key][key2] = CVarVal;
							end
							--
							if not AcctBackup[key][key2] or not CharBackup[key][key2] then
								errors = errors or 0 + 1;	
							end		
						
							AcctBackup[key][key2] = CVarVal;
							CharBackup[key][key2] = CVarVal;
						
						end
					
					end
				
				end -- // end root for key,val
			
			
				if not backupType or backupType == nil or backupType == "" then
					
					ZerkinzCfgAcct["Backup"] 	= ZerkinzCfgAcct["Backup"] or {};
					ZerkinzCfgAcct["Backup"]	= AcctBackup ;
					
					ZerkinzCfgChar["Backup"] 	= ZerkinzCfgChar["Backup"] or {};
					ZerkinzCfgChar["Backup"]	= CharBackup
				
				elseif backupType and stringMatch("Acct", backupType) or stringMatch("Account", backupType) or backupType == "Acct" or backupType == "Account" then
				
					ZerkinzCfgAcct["Backup"] 	= ZerkinzCfgAcct["Backup"] or {};
					ZerkinzCfgAcct["Backup"]	= AcctBackup;
				
				elseif backupType and stringMatch("Char", backupType) or stringMatch("Character", backupType) or backupType == "Char" or backupType == "Character" then
					
					ZerkinzCfgChar["Backup"] 	= ZerkinzCfgChar["Backup"] or {};
					ZerkinzCfgChar["Backup"]	= CharBackup;
				
				end
			
			
			end -- // end if self.Modules[moduleMatch]
		
		end -- // end if moduleName

		local UserCVars = {};
		UserCVars["ActionCam"] = {};
		UserCVars["All"] = {};
		UserCVars["Graphics"] = {};
		UserCVars["Shadows"] = {};			

		
		if errors == 0 then
		
			return true;
		
		else 
		
			return false;
		
		end
	
	end -- end function BackupProfile();


	function	ZerkinzConfig.EventFunctions:ADDON_LOADED(event, addon, ...)

		local self = is_table(_G[AddOnName]) or is_table(_G.ZerkinzConfig);

		self['LaunchEvents'] = self['LaunchEvents'] or {};
		self['LaunchEvents'].ADDON_LOADED = 1;
		
		--self.scriptStart = GetTime();

		--[[	Call Compartmentalized Initialization Objects/Methods	]]--
				--self:InstantiateCoreArrays();
		--[[		
				self:InstantiateCoreArrays("true");

				self.Initialize:Profiles();
				self.Initialize:EventsFrame();
				self.Initialize:ConsoleCommands();
				--self.Initialize:ConsoleWindow();
				--self.Initialize:Chat_GetFramesInfo(CHAT_FRAMES);
				self.Initialize:ConsoleWindow('ZerkinzConsole');
				--self.Initialize:ConsoleCommands();
				--self.Initialize:ProfileModules();
				
				self:InstantiateConsoleCommands();
				
				self.Actions:LoadSettings('Character');


				--ZerkinzConfig:Print("General", "|cffFFFF00=========================|r");			
				--ZerkinzConfig:Print("General", "|cffFF0000ZerkinzCfgAcct['activated_modules']:");
				--self:printArray(ZerkinzCfgAcct["activated_modules"]);
				--ZerkinzConfig:Print("General", "|cffFF0000ZerkinzCfgChar['activated_modules']:");
				--self:printArray(ZerkinzCfgChar["activated_modules"]);	
			
				self:AcceptPopUp("Accept", "Disable");	
			
				ZerkinzConfig:Print("General", '|cff66FF11' .. tostring(self) .. " => AddOn_Loaded() complete.")
				ZerkinzConfig:Print("ZerkinzConsole", '|cffFF9900ADDON_LOADED( ', tostring(arg or args or 'args were supposed to be here.. lol'), ' );');
	
				self.scriptEnd = GetTime();
				self.scriptExecution = ( tonumber(self.scriptEnd) or GetTime() ) - ( tonumber(self.scriptStart) or GetTime() );
				self.initialized = true;
	
				ZerkinzConfig:Print("Raid", ":|cff00FFFFOnInitialize()|r was |cff66FF11executed in|r ", self.scriptExecution, " |cff66FF11seconds.|r");		
		]]
				
		--		_self	= self;
		--local	self 	= _G[AddOnName];

				ZerkinzConfig:Print("General", ColorText('66FF11', "ADDON_LOADED( |cffFFFFFF"..tostring(addon).."|r )"), "( self = " .. tostring(self and self:GetName()) .. ", "..tostring(event)..", "..tostring(addon) .. " )");

				return true;

	end




	--[[ begin self.Modules object -- ]]
	function	ZerkinzConfig.EventFunctions:PLAYER_LOGIN(event, value, ...)
		
		local _self = self;
		local self = _G[AddOnName];	
		
		self.Initialize:ConsoleWindow('ZerkinzConsole');

		local arg_count = select("#", ...);
		local arg_string = ( ( type(arg_count) == 'number' and arg_count ) or 0 ) > 0 and tostring(...);
		local args = { ... };

		--self:AcceptPopUp("Accept", "Disable");
		--self.Initialize:Chat_GetFramesInfo(CHAT_FRAMES);
		--self.Console();

		--local CreateChatWindow_return = self:CreateChatWindow('ZerkinzConsole');

		self:AcceptPopUp("Accept", "Disable");

		ZerkinzConfig:Print("General", 'PLAYER_LOGIN( ['..tostring(arg_string)..']; ');

		--print("|>", CreateChatWindow_return,  "|cff33FF33 ZerkinzConfig.Events:PLAYER_LOGIN()|r:|cff33FF33Initialized()|r :: To access the ZerkinzConfig command line interface, type: \n|cffFF0000 /ZerkinzConfig|r, or|cffFF6600 /zcfg|r, or |cffFFFF33/ZC|r for the list of available functions.");	
		
		return true; 
		
		--CreateChatWindow_return or false;

		--[[
		if	type(args) == 'table' and arg_count ~= nil and tonumber(arg_count) > 0 then
			
			for k,v in ipairs(args) do
				ZerkinzConfig:Print("General", (_self and _self:GetName()), ' PLAYER_LOGIN( ['..tostring(k)..'] = '..tostring(v)..' );');
			end

		end
		]]
		--_G["PopUpAccepted"] = nil;

		--ZerkinzConfig:Print("General", tostring(_self and tostring(_self:GetName()) or '').."["..ColorText('PLAYER_LOGIN', "FF0000").."];");
		
		--ZerkinzConfig:Print("General", "Successfully initialized from PLAYER_LOGIN.");

		--printArray(ZerkinzCfgAcct);

		--[[
		local moduleInstantiated = self:InstantiateModule("ActionCam");
			--self:InstantiateModule("Shadows");	// remove dashes to enable
			--self:InstantiateModule("Graphics");	// remove dashes to enable
		local saveComplete = self:BackupProfile();
		local loadStatus = self:Install("ActionCam");

		--ZerkinzCfgAcct.loginCount = ZerkinzCfgAcct.loginCount + 1;
		--ZerkinzCfgChar.loginCount = ZerkinzCfgChar.loginCount + 1;
		if loadStatus == true then
			print("You've logged in "..tostring(ZerkinzCfgAcct.loginCount).." times");
			print("|cffFF0000" .. tostring(UnitName("Player")).."|r logged in "..tostring(ZerkinzCfgChar.loginCount).." times");
		
		else
			print("Sorry, there was an error loading |cffFF0000self.Modules|r, " .. tostring(UnitName("Player")) .. ".");
			
		end
		]]

	end


	function	ZerkinzConfig.EventFunctions:PLAYER_LOGOUT(event, value, ...)

		local self = is_table(_G[AddOnName]) or is_table(_G.ZerkinzConfig); 

		self['Settings']							= is_table(self['Settings']) or {};
		self['Settings']['SaveSettingsOnLogout']	= (isset(self['Settings']['SaveSettingsOnLogout']) and self['Settings']['SaveSettingsOnLogout'])  or true;
		
		if	self['Settings']['SaveSettingsOnLogout']  then
			
			local save_status = self.Actions:SaveSettings('Character');
			self:Print('General', 'SaveSettings to your character profile returned [', save_status, '];')

			return save_status;
		
		else
			return true;

		end
		
	end


	function	ZerkinzConfig.EventFunctions:PLAYER_ENTERING_WORLD(...)
		
		local self = _G[AddOnName];
		local AddOn = _G[AddOnName];
		self:Print("ZerkinzConsole", "Player entering world.");
		self:AcceptPopUp("Accept", "Disable");
		--self:AcceptPopUp();

	end




	function	ZerkinzConfig.EventFunctions:CHAT_MSG_SYSTEM(args)

		local	calledMethod = self;
		local	self = _G[AddOnName];

		--ZerkinzConfig:Print("General", "|cffFF9900[CHAT_MSG_SYSTEM][" .. tostring(calledMethod) .. "]( " .. tostring(args) .. " )");

		

		if self:IsPopUpShown() then
		
			ZerkinzConfig:Print("General", "Popup is visible; attempting to accept it..");
			--_G["PopUpAccepted"] =
			self:AcceptPopUp("Accept", "Disable");
		
		else
			
			
			--ZerkinzConfig:Print("General", "No popup is visible.");
			--_G["PopUpAccepted"] = self:AcceptPopUp("Accept", "Disable");
		
		end

		--self:AcceptPopUp("Accept", "Disable");	


	end



	function	ZerkinzConfig.EventFunctions:CHAT_MSG_CHANNEL(args)

		local	calledMethod = self;
		local	self = _G[AddOnName];

		--ZerkinzConfig:Print("General", "|cffFF9900[CHAT_MSG_CHANNEL][" .. tostring(calledMethod) .. "]( " .. tostring(args) .. " )");
		--[[
		if self:IsPopUpShown() then
		
			ZerkinzConfig:Print("General", "Popup is visible; attempting to accept it..");
			--_G["PopUpAccepted"] =
			self:AcceptPopUp("Accept", "Disable");

		else
		
			--ZerkinzConfig:Print("General", "No popup is visible.");
			--_G["PopUpAccepted"] = self:AcceptPopUp("Accept", "Disable");
		
		end
		]]
		--self:AcceptPopUp("Accept", "Disable");	


	end




	function	ZerkinzConfig.EventFunctions:SYSMSG(args)

		local	calledMethod = self;
		local	self = _G[AddOnName];

		ZerkinzConfig:Print("General", "|cffFF9900[SYSMSG][" .. tostring(calledMethod) .. "]( " .. tostring(args) .. " )");

		--[[
		if self:IsPopUpShown() then
		
			ZerkinzConfig:Print("General", "Popup is visible; attempting to accept it..");
			--_G["PopUpAccepted"] =
			self:AcceptPopUp("Accept", "Disable");

		else
		
			--ZerkinzConfig:Print("General", "No popup is visible.");
			--_G["PopUpAccepted"] = self:AcceptPopUp("Accept", "Disable");
		
		end
		]]

		--self:AcceptPopUp("Accept", "Disable");	


	end




	function	ZerkinzConfig.EventFunctions:SPELLS_CHANGED(event, value, ...)

		local 	self = _G[AddOnName];
		

		if	self["Events"]["States"] and type(self["Events"]["States"]) == "table" then
		
			for k,v in pairs(self["Events"]["States"]) do

				ZerkinzConfig:Print("General", "[" .. tostring(k) .. "] => '" .. tostring(v) .. "';")
			
			end
		
		end


		--self.Initialize:ProfileModules(...);
		--self.Actions:LoadSettings('Character');

		
		if	self:IsPopUpShown()	then

			--ZerkinzConfig:Print("General", "|cffFF9900[Events]|cffFFFFFF:|r[SPELLS_CHANGED] |cffFFFFFF->|r|r |cffFFFF00IsPopUpShown() returned TRUE!..|r");
			ZerkinzConfig:Print("General", "|cffFFFF00Attempting to |cffDD0000[|cffFFFFFF Accept |r]|r the Popup; standby..|r")
			--_G["PopUpAccepted"] =
			self:AcceptPopUp("Accept", "Disable");
			
		else
		
			--ZerkinzConfig:Print("General", "|cffFF9900[Events]|cffFFFFFF:|r[SPELLS_CHANGED] |cffFFFFFF->|r|r |cffFFFF00IsPopUpShown() returned |cffDD0000FALSE|r for some reason. Attempting to AcceotPopup anyways..|r");
			--self:AcceptPopUp("Accept", "Disable");
		
		end


	end



	function	ZerkinzConfig.EventFunctions:PLAYER_STARTED_MOVING(event, value, ...)
		
		local this = self;
		local self = _G[AddOnName];
		local EventFrame = _G[AddOnName]["Frames"]["Events"];

		local consoleExists = Chat_GetWindow('ZerkinzConsole') or nil;

		if not consoleExists then

			self:Print('General', 'Creating ZerkinzConsole window... standby..');
			--return self:CreateChatWindow('ZerkinzConsole');

		end
		--[[

		if self.PopUpAccepted == "1" then 

			self.Methods:EventHandler(EventFrame, "Unregister", self.PopUpEvents);
			
		end
		
		-- [ [ DEBUG: ZerkinzConfig:Print("General", "PLAYER_STARTED_MOVING still reg'd");  ] ]
		--ZerkinzConfig:Print("General", tostring(self) .. " :: PopUpAccepted and _G[AddOnName]["Frames"]["Events"] and not _G.eventUnregistered");
		ZerkinzConfig:Print("General", "PLAYER_STARTED_MOVING( ", self, " | ", this, ", ", event, ", ", tostring(... or 'none'), " );");



		--ZerkinzConfig:Print("General", tostring(self) .. " :: PopUpAccepted and ZerkinzEventFrame and not _G.eventUnregistered");

		
		local activePopUp = self:IsPopUpShown();
		
		if	not activePopUp then

				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_MOVING')
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_TURNING')
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'GLOBAL_MOUSE_DOWN')
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'CURSOR_UPDATE')			
		
		else

		--if not _G["PopUpAccepted"] then
		
			--_G["PopUpAccepted"] =
			self:AcceptPopUp("Accept", "Disable");

			if 	( type(EventFrame) == 'table' )		or		( _G["PopUpAccepted"] and ( type(self["Frames"]["Events"]) == 'table'	) )	then
						
				--DEBUG: 
				--ZerkinzConfig:Print("General", tostring(self) .. " :: PopUpAccepted and ZerkinzEventFrame and not _G.eventUnregistered");
				
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", self.PopUpEvents);			
			
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_MOVING')
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_TURNING')
					--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'GLOBAL_MOUSE_DOWN')
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'CURSOR_UPDATE')
			
				--PopUpAccepted = nil;
						
			end -- if PopUpAccepted 
		
		end -- if NOT PopUpAccepted
	]]
	end



	function	ZerkinzConfig.EventFunctions:GLOBAL_MOUSE_DOWN(event, ...)

		local self = _G[AddOnName]
		ZerkinzConfig:Print("General", tostring(this), event, eventParameters, self, self.name);

		self:EventManager(event);
		--self:IsPopUpShown();

		--/script DEFAULT_CHAT_FRAME:AddMessage( GetMouseFocus():GetName() ); DEFAULT_CHAT_FRAME:AddMessage( tostring(VideoOptionsFrame:IsShown()) );
																	--SettingsPanel.CategoryList.ScrollBox.ScrollTarget.1f4fl35d830															
		--local	VideoOptionsFrameString								= 'SettingsPanel.CategoryList.ScrollBox.ScrollTarget.lfefad9bd70';

		local	mouseDownFocus										= GetMouseFocus():GetName() or false;
				self.mouseDownFocus									= mouseDownFocus;

		local	VideoOptionsMenuButton								= 'GameMenuButtonSettings';
		local	VideoOptionsFrameString								= 'SettingsPanel';
		local	VideoOptionsFrame									= _G[VideoOptionsFrameString];
		local	VideoOptionsFrameIsShown;
		
				self.VideoOptionsMenuButton							= VideoOptionsMenuButton;
				self.VideoOptionsFrameString						= VideoOptionsFrameString;

				
		if	mouseDownFocus == VideoOptionsMenuButton	then
			self.Methods:EventHandler(self.Frames.Events, "Register", 'GLOBAL_MOUSE_UP');
		end

		if	VideoOptionsFrame then

			VideoOptionsFrameIsShown							= VideoOptionsFrame:IsShown();
			self.VideoOptionsFrame_IsShown						= VideoOptionsFrameIsShown;
			self.VideoOptionsFrameIsShown						= VideoOptionsFrameIsShown;
				
		end	


		if	VideoOptionsFrameIsShown then
			
			local 	mouseFocus = mouseDownFocus;
			--ZerkinzConfig:Print("General", "mouseFocus => " .. tostring(mouseFocus));
			--ZerkinzConfig:Print("General", "VideoOptionsFrameShown => " .. tostring(VideoOptionsFrameIsShown));		
		
			self.Methods:EventHandler(self.Frames.Events, "Register", 'GLOBAL_MOUSE_UP');
		
			local VideoOptionsFrameButtons	 = {};
		
			VideoOptionsFrameButtons["VideoOptionsFrameOkay"] 		=	'SettingsPanel.OkayButton';	-- 'VideoOptionsFrameOkay';
			VideoOptionsFrameButtons["VideoOptionsFrameCancel"]	=	'SettingsPanel.CancelButton';	--	'VideoOptionsFrameCancel';
			VideoOptionsFrameButtons["VideoOptionsFrameApply"]		=	'SettingsPanel.ApplyButton'; --	'VideoOptionsFrameApply';	
			-- SettingsPanel.CategoryList.ScrollBox.ScrollTarget.1fefad9bd70
		
			if mouseFocus and VideoOptionsFrameButtons[mouseFocus] then
				
				--ZerkinzConfig:Print("General", "self.mouseDown = ", tostring(mouseFocus))
				self.mouseDown = mouseFocus;
				--self.Methods:EventHandler("ZerkinzEventFrame", "Register", 'GLOBAL_MOUSE_UP');	
			
			else
			
				self.mouseDown = nil;
			
			end
		
			--ZerkinzConfig:Print("General", "VideoOptionsFrameShown => " .. tostring(VideoOptionsFrameIsShown));	
			
		
		else -- if VidOpts NOT shown
		
			--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'GLOBAL_MOUSE_UP');
		
		end
		

	end -- end GLOBAL_MOUSE_DOWN()



	function	ZerkinzConfig.EventFunctions:GLOBAL_MOUSE_UP(this, event, ...)

		ZerkinzConfig:Print("General", tostring(this), event, eventParameters, self, self.name);
		local self = _G[AddOnName]
		
		self:EventManager(event);

		local	mouseUpFocus										= GetMouseFocus():GetName() or false;
				self.mouseUpFocus									= mouseUpFocus;		
		
		--local VideoOptionsFrame 								= _G["VideoOptionsFrame"];
		local	VideoOptionsFrameIsShown							= VideoOptionsFrame:IsShown();

		if not	self.VideoOptionsFrame_IsShown	or	not VideoOptionsFrameIsShown	then
		
			self.Methods:EventHandler(ZerkinzConfig.Frames.Events, "Unregister", 'GLOBAL_MOUSE_UP');

		elseif	self.VideoOptionsFrame_IsShown and not VideoOptionsFrameIsShown and self.mouseDownFocus and self.mouseUpFocus and tostring(self.mouseDownFocus) == tostring(self.mouseUpFocus) then
		
			ZerkinzConfig:Print("General", tostring(self.mouseDownFocus), " was successfully registered!")
			self.Initialize:ProfileModules();
			
			self.Methods:EventHandler(self.Frames.Events, "Unregister", 'GLOBAL_MOUSE_UP');
		
		end

	end



	function	ZerkinzConfig.EventFunctions:PLAYER_STARTED_TURNING(this, event, ...)
		--[[
		ZerkinzConfig:Print("General", tostring(this), event, eventParameters, self, self.name);
		local self = _G[AddOnName]
		
		self:EventManager(event);
		]]
	end


	--[[
	function	ZerkinzConfig.EventFunctions:GLOBAL_MOUSE_DOWN()

		local ZerkinzEventFrame = _G.ZerkinzEventFrame;
		local activePopUp = self:IsPopUpShown();

		if	not activePopUp then
		
				self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_MOVING')
				self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_TURNING')
				----self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'GLOBAL_MOUSE_DOWN')
				self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'CURSOR_UPDATE')			
		
		else

		--if not _G["PopUpAccepted"] then
		
			_G["PopUpAccepted"] = self:AcceptPopUp("Accept", "Disable");

			if _G["PopUpAccepted"] and ZerkinzEventFrame then
						
				--DEBUG: ZerkinzConfig:Print("General", "PopUpAccepted and ZerkinzEventFrame and not _G.eventUnregistered");
					
				self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_MOVING')
				self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_TURNING')
				----self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'GLOBAL_MOUSE_DOWN')
				self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'CURSOR_UPDATE')
			
				--PopUpAccepted = nil;
						
			end -- if PopUpAccepted 
		
		end -- if NOT PopUpAccepted

	end
	]]


	--[[
	function	ZerkinzConfig.EventFunctions:CURSOR_UPDATE()
		
		local self = _G[AddOnName];

		local ZerkinzEventFrame = _G[AddOnName]["Frames"]["Events"];
		local activePopUp = self:IsPopUpShown();

		if	not activePopUp then
		
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_MOVING')
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_TURNING')
				----self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'GLOBAL_MOUSE_DOWN')
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'CURSOR_UPDATE')			
		
		else

		--if not _G["PopUpAccepted"] then
		
			--_G["PopUpAccepted"] =
			self:AcceptPopUp("Accept", "Disable");

			if _G["PopUpAccepted"] and	( type(self["Frames"]["Events"]) == 'table' 	or		type(ZerkinzEventFrame) == 'table' )	then
						
				--DEBUG: ZerkinzConfig:Print("General", "PopUpAccepted and ZerkinzEventFrame and not _G.eventUnregistered");
					
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_MOVING')
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'PLAYER_STARTED_TURNING')
				----self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'GLOBAL_MOUSE_DOWN')
				--self.Methods:EventHandler("ZerkinzEventFrame", "Unregister", 'CURSOR_UPDATE')
			
				--PopUpAccepted = nil;
						
			end -- if PopUpAccepted 
		
		end -- if NOT PopUpAccepted

	end	
	]]



	function	ZerkinzConfig.EventFunctions:PLAYER_SOFT_ENEMY_CHANGED(self, ...)

				local args = {...};
				ZerkinzConfig:Print("General", tostring(arg or (...)), tostring(...));

				for k,v in pairs(args) do
					ZerkinzConfig:Print("General", "[", k, "] = ", v, ";");
				end

				--local this = self;
				--local self = _G[AddOnName];
				
				--ZerkinzConfig:Print("General", CVar, value, args);

	end



	function	ZerkinzConfig.EventFunctions:CONSOLE_MESSAGE(...)
	
		--local newArgs = { select(3, ...) };
		local event, value = ...;
		local args = {...};

		--[[
		if #(args) >= 3 then

			args = {}
			args["str"] = {};
			args["int"] = {};
			
			local i;

			ZerkinzConfig:Print('General', '==== newArgs ==>');

			for k,v in pairs(newArgs) do

				i = (i or 0) + 1;
				args["int"][i]  = v;
				args["str"][k] = v;

				if	is_table(v)	then
					for i,v in ipairs( { table_tostring(v, 235, 'unpack') } ) do
						ZerkinzConfig:Print('General', tostring(v));
					end
					print_r(v);
				end

				ZerkinzConfig:Print("General", "//--["..tostring(k).."]:\n\009|====["..tostring(v).."];");
				ZerkinzConfig:ConsolePrint("["..tostring(k).."] = "..tostring(v)..";");

			end

			ZerkinzConfig:Print('General', '===[ arg ]==>');
			
			for k,v in pairs(args) do

				i = (i or 0) + 1;
				args["int"][i]  = v;
				args["str"][k] = v;

				if	is_table(v)	then
					for i,v in ipairs( { table_tostring(v, 235, 'unpack') } ) do
						ZerkinzConfig:Print('General', tostring(v));
					end
					print_r(v);
				end

				ZerkinzConfig:Print("General", event, " = ", value, " :: ", tostring(k), "]:\n\009|====["..tostring(v).."];");
				ZerkinzConfig:ConsolePrint("["..tostring(k).."] = "..tostring(v)..";");

			end			
			
		end
		]]

		local calledMethod = self;
		local self = _G[AddOnName];
		--local arg1, arg2, arg3, arg4 = self:GetArgs(tostring(...), 4);	
	
		local string = tostring( tostring(type(calledMethod) == 'table' and calledMethod:GetName() ) or self:GetName().."( "..ColorText(tostring(calledMethod)..", "..tostring(event)..", ", "FFFF00").." = "..ColorText(tostring(value), "FF9933").." );");
		
		local consoleFrame = Chat_GetWindow('ZerkinzConsole') or nil;

		if	consoleFrame then
			ZerkinzConfig:Print('ZerkinzConsole', string);
			--ZerkinzConfig.ChatWindows.ZerkinzConsole:AddMessage(string);
		end		

		ZerkinzConfig:Print("General", string);
		ZerkinzConfig:Print('ZerkinzConsole', string);

		return true;
		--ZerkinzConfig:Print("General", "|cffFF9900A CONSOLE_MESSAGE was detected!|r")
		--ZerkinzConfig:Print("General",  tostring(select(1, args)), tostring(select(2, args)) );	
		--ZerkinzConfig:Print("General",  tostring(select(1, eventName)), tostring(select(1, value)) );
		--ZerkinzConfig:Print("General",  tostring(eventName), tostring(value) );
		--ZerkinzConfig:Print("General", "|cffFF9900Console [" .. tostring(event or '') .. tostring(calledMethod or '') .. "]|r('|cffFFFF66" .. tostring(args) .. "|r');");
	
		--ZerkinzConfig:Print("General",  tostring(newArgs), ";\n", tostring(args), ";\n", tostring(CVar), ";\n", tostring(value), ";\n" );
	
	end


	function	ZerkinzConfig.EventFunctions:CVAR_UPDATE(event, value, ...)
		
		local self = is_table(_G[AddOnName]) or is_table(_G.ZerkinzConfig);
		local consoleFrame = (  Chat_GetWindow('ZerkinzConsole') )-- or ( Chat_CreateWindow('ZerkinzConsole') and Chat_GetWindow('ZerkinzConsole') )  );

		if	not consoleFrame  then
			return false;
		else
			--consoleFrame:AddMessage(string);
			local string = tostring(self:GetName() or _G[AddOnName]).."( |cffFFFF00"..(self and tostring(self))..", "..tostring(event) .. "|r = |cffFF9933"..tostring(value).."|r );";
			ZerkinzConfig:Print('ZerkinzConsole', string);
			return true;
		end	

	end
		--[[
		local newArgs = {...};
		local args;

		if #(newArgs) >= 1 then

			args = {};
			
			for k,v in pairs(newArgs) do
				
				local i = (i or 0) + 1;
				args[k]  = v;

				--ZerkinzConfig:Print("ZerkinzConsole", "//--["..(type(self)=="table" and self:GetName()) or (event and tostring(event))..tostring(k).."]:\n\009|====["..tostring(v).."];");
				ZerkinzConfig:ConsolePrint("["..tostring(k).."] = "..tostring(v)..";");
				
			end
			
		end
		]]

		--local calledMethod = self;
		--local arg1, arg2, arg3, arg4 = self:GetArgs(args, 4);	
	
		--[[
		if 	not consoleFrame	then
			local createWindow_status = Chat_CreateWindow('ZerkinzConsole');
			consoleFrame = Chat_GetWindow('ZerkinzConsole');
		end
		]]
			
	--ZerkinzConfig.Initialize:EventsFrame();

-- eof