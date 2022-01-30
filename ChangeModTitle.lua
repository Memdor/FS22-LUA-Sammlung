--[[
Script to change the mod title in the mod view

Author:		Ifko[nator]
Date:		21.01.2019
Version:	2.0

History:	V 1.0 @ 11.05.2018 - initial release in FS 17
			V 2.0 @ 21.01.2019 - initial release in FS 19

<changeModTitle modTitle="_modTitle_"/>
]]

ChangeModTitle = {};

ChangeModTitle.modDirectory = g_currentModDirectory;
ChangeModTitle.currentModName = g_currentModName;

local function changeModTitle()
	local modDesc = loadXMLFile("modDesc", ChangeModTitle.modDirectory .. "modDesc.xml");
	local modTitle = Utils.getNoNil(getXMLString(modDesc, "modDesc.changeModTitle#modTitle"), "");
	
	if modTitle ~= "" then
		if string.sub(modTitle, 1, 6) == "$l10n_" then
			modTitle = g_i18n:getText(string.sub(modTitle, 7));
		elseif g_i18n:hasText(modTitle) then
			modTitle = g_i18n:getText(modTitle);
		end;
		
		for _, storeItem in pairs(g_storeManager.modStoreItems) do
			if storeItem.customEnvironment == ChangeModTitle.currentModName then	
				storeItem.isMod = false;
				
				storeItem.dlcTitle = modTitle;
			end;
		end;
	else
		print("Error from the ChangeModTitle.lua: Missing modTitle Attribute in modDesc file! Script is stopped!");
	end;
	
	delete(modDesc);
end;

Vehicle.init = Utils.appendedFunction(Vehicle.init, changeModTitle);