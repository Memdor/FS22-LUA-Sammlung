---@type string directory of the mod.
local modDirectory = g_currentModDirectory or ""

function onLoadMapFinished(mission, node)	
	if node ~= 0 and modDirectory ~= nil then
		local newFillTypes = loadXMLFile("fillTypes", modDirectory.."fillTypes/fillTypes.xml")	
				
		---workaround to get the new filltypes localized
		if type(newFillTypes) ~= "table" then
			newFillTypes = XMLFile.wrap(newFillTypes, g_fillTypeManager.xmlSchema)
		end
		newFillTypes:iterate("map.fillTypes.fillType", function(_, key)
			local fillTypeName = tostring(newFillTypes:getValue(key.."#name"))
			local fillTypeTitle = tostring(newFillTypes:getValue(key.."#title"))			
			fillTypeTitle = fillTypeTitle:gsub("$l10n_","")			
			g_currentMission.hud.l10n.texts[fillTypeTitle] = g_i18n:getText(fillTypeTitle)			
		end)	
		
		---load from xml-file				
		g_fillTypeManager:loadFillTypes(newFillTypes, modDirectory, false, nil)
			
		---Refresh Filltypes in HUD	
		g_currentMission.hud.fillLevelsDisplay:refreshFillTypes(g_fillTypeManager)
	end;
end;

FSBaseMission.loadMapFinished = Utils.prependedFunction(FSBaseMission.loadMapFinished, onLoadMapFinished)