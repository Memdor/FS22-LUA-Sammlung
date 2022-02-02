--[[ toggleAnimation 

Author: 		HoFFi (modding-welt.com)
Remarks:		animations are limited to 10 for the current state


Description: 	script for activating xml-defined animation with user-defined input keys

Version: 		1.0.0.0

Changelog: 		2021-06-06 	- draft version
				2021-07-09	- first ready-to-use version
				2021-12-30	- converted to FS22 and improved some things


--------------------------------------------------------------------------------------------------


]]


toggleAnimation = {};

toggleAnimation.modDir = g_currentModDirectory;
toggleAnimation.currentModName = g_currentModName;

function toggleAnimation.prerequisitesPresent(specializations)
    return true; 
end;

function toggleAnimation.registerEventListeners(vehicleType)
	for _, spec in pairs({"onLoad", "onRegisterActionEvents", "actionEventTA_anim1", "actionEventTA_anim2", "actionEventTA_anim3", "actionEventTA_anim4", "actionEventTA_anim5", "actionEventTA_anim6", "actionEventTA_anim7", "actionEventTA_anim8", "actionEventTA_anim9", "actionEventTA_anim10"}) do
		SpecializationUtil.registerEventListener(vehicleType, spec, toggleAnimation)
	end
end

function toggleAnimation.registerFunctions(vehicleType)
    SpecializationUtil.registerFunction(vehicleType, "actionEventTA_anim1", toggleAnimation.actionEventTA_anim1)
    SpecializationUtil.registerFunction(vehicleType, "actionEventTA_anim2", toggleAnimation.actionEventTA_anim2)
    SpecializationUtil.registerFunction(vehicleType, "actionEventTA_anim3", toggleAnimation.actionEventTA_anim3)
    SpecializationUtil.registerFunction(vehicleType, "actionEventTA_anim4", toggleAnimation.actionEventTA_anim4)
    SpecializationUtil.registerFunction(vehicleType, "actionEventTA_anim5", toggleAnimation.actionEventTA_anim5)
    SpecializationUtil.registerFunction(vehicleType, "actionEventTA_anim6", toggleAnimation.actionEventTA_anim6)
    SpecializationUtil.registerFunction(vehicleType, "actionEventTA_anim7", toggleAnimation.actionEventTA_anim7)
    SpecializationUtil.registerFunction(vehicleType, "actionEventTA_anim8", toggleAnimation.actionEventTA_anim8)
    SpecializationUtil.registerFunction(vehicleType, "actionEventTA_anim9", toggleAnimation.actionEventTA_anim9)
    SpecializationUtil.registerFunction(vehicleType, "actionEventTA_anim10", toggleAnimation.actionEventTA_anim10)
end

function toggleAnimation:onLoad(savegame)
	local schema = Vehicle.xmlSchema
    schema:setXMLSpecializationType("toggleAnimation")
	
	print("Info: toggleAnimation loaded to: " .. toggleAnimation.currentModName)
	
	schema:register(XMLValueType.STRING, "vehicle.toggleAnimation#anim1", "Animation name")
	schema:register(XMLValueType.STRING, "vehicle.toggleAnimation#anim2", "Animation name")
	schema:register(XMLValueType.STRING, "vehicle.toggleAnimation#anim3", "Animation name")
	schema:register(XMLValueType.STRING, "vehicle.toggleAnimation#anim4", "Animation name")
	schema:register(XMLValueType.STRING, "vehicle.toggleAnimation#anim5", "Animation name")
	schema:register(XMLValueType.STRING, "vehicle.toggleAnimation#anim6", "Animation name")
	schema:register(XMLValueType.STRING, "vehicle.toggleAnimation#anim7", "Animation name")
	schema:register(XMLValueType.STRING, "vehicle.toggleAnimation#anim8", "Animation name")
	schema:register(XMLValueType.STRING, "vehicle.toggleAnimation#anim9", "Animation name")
	schema:register(XMLValueType.STRING, "vehicle.toggleAnimation#anim10", "Animation name")
	
	
	self.toggleAnimation = {}
	self.toggleAnimation.anim1 = self.xmlFile:getValue("vehicle.toggleAnimation#anim1")
	self.toggleAnimation.anim2 = self.xmlFile:getValue("vehicle.toggleAnimation#anim2")
	self.toggleAnimation.anim3 = self.xmlFile:getValue("vehicle.toggleAnimation#anim3")
	self.toggleAnimation.anim4 = self.xmlFile:getValue("vehicle.toggleAnimation#anim4")
	self.toggleAnimation.anim5 = self.xmlFile:getValue("vehicle.toggleAnimation#anim5")
	self.toggleAnimation.anim6 = self.xmlFile:getValue("vehicle.toggleAnimation#anim6")
	self.toggleAnimation.anim7 = self.xmlFile:getValue("vehicle.toggleAnimation#anim7")
	self.toggleAnimation.anim8 = self.xmlFile:getValue("vehicle.toggleAnimation#anim8")
	self.toggleAnimation.anim9 = self.xmlFile:getValue("vehicle.toggleAnimation#anim9")
	self.toggleAnimation.anim10 = self.xmlFile:getValue("vehicle.toggleAnimation#anim10")
end;

function toggleAnimation:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection)
	if self.isClient then
        local spec = self.spec_cylindered
        --self:clearActionEventsTable(spec.actionEvents)

        if isActiveForInputIgnoreSelection then
		
			if self.toggleAnimation.anim1 ~= nil then
				local _, actionEventId1 = self:addPoweredActionEvent(spec.actionEvents, InputAction.TA_anim1, self, toggleAnimation.actionEventTA_anim1, false, true, false, true, nil)
				g_inputBinding:setActionEventTextPriority(actionEventId1, GS_PRIO_VERY_HIGH)
				g_inputBinding:setActionEventText(actionEventId1, g_i18n:getText("input_TA_anim1"))
			end
			if self.toggleAnimation.anim2 ~= nil then
				local _, actionEventId2 = self:addPoweredActionEvent(spec.actionEvents, InputAction.TA_anim2, self, toggleAnimation.actionEventTA_anim2, false, true, false, true, nil)
				g_inputBinding:setActionEventTextPriority(actionEventId2, GS_PRIO_VERY_HIGH)
				g_inputBinding:setActionEventText(actionEventId2, g_i18n:getText("input_TA_anim2"))
			end
			if self.toggleAnimation.anim3 ~= nil then	
				local_, actionEventId3 = self:addPoweredActionEvent(spec.actionEvents, InputAction.TA_anim3, self, toggleAnimation.actionEventTA_anim3, false, true, false, true, nil)
				g_inputBinding:setActionEventTextPriority(actionEventId3, GS_PRIO_VERY_HIGH)
				g_inputBinding:setActionEventText(actionEventId3, g_i18n:getText("input_TA_anim3"))
			end
			if self.toggleAnimation.anim4 ~= nil then	
				local_, actionEventId4 = self:addPoweredActionEvent(spec.actionEvents, InputAction.TA_anim4, self, toggleAnimation.actionEventTA_anim4, false, true, false, true, nil)
				g_inputBinding:setActionEventTextPriority(actionEventId4, GS_PRIO_VERY_HIGH)
				g_inputBinding:setActionEventText(actionEventId4, g_i18n:getText("input_TA_anim4"))
			end
			if self.toggleAnimation.anim5 ~= nil then	
				local_, actionEventId5 = self:addPoweredActionEvent(spec.actionEvents, InputAction.TA_anim5, self, toggleAnimation.actionEventTA_anim5, false, true, false, true, nil)
				g_inputBinding:setActionEventTextPriority(actionEventId5, GS_PRIO_VERY_HIGH)
				g_inputBinding:setActionEventText(actionEventId5, g_i18n:getText("input_TA_anim5"))
			end
			if self.toggleAnimation.anim6 ~= nil then	
				local_, actionEventId6 = self:addPoweredActionEvent(spec.actionEvents, InputAction.TA_anim6, self, toggleAnimation.actionEventTA_anim6, false, true, false, true, nil)
				g_inputBinding:setActionEventTextPriority(actionEventId6, GS_PRIO_VERY_HIGH)
				g_inputBinding:setActionEventText(actionEventId6, g_i18n:getText("input_TA_anim6"))
			end
			if self.toggleAnimation.anim7 ~= nil then	
				local _, actionEventId7 = self:addPoweredActionEvent(spec.actionEvents, InputAction.TA_anim7, self, toggleAnimation.actionEventTA_anim7, false, true, false, true, nil)
				g_inputBinding:setActionEventTextPriority(actionEventId7, GS_PRIO_VERY_HIGH)
				g_inputBinding:setActionEventText(actionEventId7, g_i18n:getText("input_TA_anim7"))
			end
			if self.toggleAnimation.anim8 ~= nil then	
				local _, actionEventId8 = self:addPoweredActionEvent(spec.actionEvents, InputAction.TA_anim8, self, toggleAnimation.actionEventTA_anim8, false, true, false, true, nil)
				g_inputBinding:setActionEventTextPriority(actionEventId8, GS_PRIO_VERY_HIGH)
				g_inputBinding:setActionEventText(actionEventId8, g_i18n:getText("input_TA_anim8"))
			end
			if self.toggleAnimation.anim9 ~= nil then	
				local _, actionEventId9 = self:addPoweredActionEvent(spec.actionEvents, InputAction.TA_anim9, self, toggleAnimation.actionEventTA_anim9, false, true, false, true, nil)
				g_inputBinding:setActionEventTextPriority(actionEventId9, GS_PRIO_VERY_HIGH)
				g_inputBinding:setActionEventText(actionEventId9, g_i18n:getText("input_TA_anim9"))
			end
			if self.toggleAnimation.anim10 ~= nil then	
				local _, actionEventId10 = self:addPoweredActionEvent(spec.actionEvents, InputAction.TA_anim10, self, toggleAnimation.actionEventTA_anim10, false, true, false, true, nil)
				g_inputBinding:setActionEventTextPriority(actionEventId10, GS_PRIO_VERY_HIGH)
				g_inputBinding:setActionEventText(actionEventId10, g_i18n:getText("input_TA_anim10"))
			end
        end
    end

end

function toggleAnimation.actionEventTA_anim1(self, actionName, inputValue, callbackState, isAnalog)
	if self:getIsAnimationPlaying(self.toggleAnimation.anim1) == false then
		if self:getAnimationTime(self.toggleAnimation.anim1) == 1 then
			self:playAnimation(self.toggleAnimation.anim1, -1, self:getAnimationTime(self.toggleAnimation.anim1), true)
		else
			self:playAnimation(self.toggleAnimation.anim1, 1, self:getAnimationTime(self.toggleAnimation.anim1), true)
		end
	else
		self:stopAnimation(self.toggleAnimation.anim1, true)
	end
end

function toggleAnimation.actionEventTA_anim2(self, actionName, inputValue, callbackState, isAnalog)
	if self:getIsAnimationPlaying(self.toggleAnimation.anim2) == false then
		if self:getAnimationTime(self.toggleAnimation.anim2) == 1 then
			self:playAnimation(self.toggleAnimation.anim2, -1, self:getAnimationTime(self.toggleAnimation.anim2), true)
		else
			self:playAnimation(self.toggleAnimation.anim2, 1, self:getAnimationTime(self.toggleAnimation.anim2), true)
		end
	else
		self:stopAnimation(self.toggleAnimation.anim2, true)
	end
end

function toggleAnimation.actionEventTA_anim3(self, actionName, inputValue, callbackState, isAnalog)
	if self:getIsAnimationPlaying(self.toggleAnimation.anim3) == false then
		if self:getAnimationTime(self.toggleAnimation.anim3) == 1 then
			self:playAnimation(self.toggleAnimation.anim3, -1, self:getAnimationTime(self.toggleAnimation.anim3), true)
		else
			self:playAnimation(self.toggleAnimation.anim3, 1, self:getAnimationTime(self.toggleAnimation.anim3), true)
		end
	else
		self:stopAnimation(self.toggleAnimation.anim3, true)
	end
end

function toggleAnimation.actionEventTA_anim4(self, actionName, inputValue, callbackState, isAnalog)
	if self:getIsAnimationPlaying(self.toggleAnimation.anim4) == false then
		if self:getAnimationTime(self.toggleAnimation.anim4) == 1 then
			self:playAnimation(self.toggleAnimation.anim4, -1, self:getAnimationTime(self.toggleAnimation.anim4), true)
		else
			self:playAnimation(self.toggleAnimation.anim4, 1, self:getAnimationTime(self.toggleAnimation.anim4), true)
		end
	else
		self:stopAnimation(self.toggleAnimation.anim4, true)
	end
end

function toggleAnimation.actionEventTA_anim5(self, actionName, inputValue, callbackState, isAnalog)
	if self:getIsAnimationPlaying(self.toggleAnimation.anim5) == false then
		if self:getAnimationTime(self.toggleAnimation.anim5) == 1 then
			self:playAnimation(self.toggleAnimation.anim5, -1, self:getAnimationTime(self.toggleAnimation.anim5), true)
		else
			self:playAnimation(self.toggleAnimation.anim5, 1, self:getAnimationTime(self.toggleAnimation.anim5), true)
		end
	else
		self:stopAnimation(self.toggleAnimation.anim5, true)
	end
end

function toggleAnimation.actionEventTA_anim6(self, actionName, inputValue, callbackState, isAnalog)
	if self:getIsAnimationPlaying(self.toggleAnimation.anim6) == false then
		if self:getAnimationTime(self.toggleAnimation.anim6) == 1 then
			self:playAnimation(self.toggleAnimation.anim6, -1, self:getAnimationTime(self.toggleAnimation.anim6), true)
		else
			self:playAnimation(self.toggleAnimation.anim6, 1, self:getAnimationTime(self.toggleAnimation.anim6), true)
		end
	else
		self:stopAnimation(self.toggleAnimation.anim6, true)
	end
end

function toggleAnimation.actionEventTA_anim7(self, actionName, inputValue, callbackState, isAnalog)
	if self:getIsAnimationPlaying(self.toggleAnimation.anim7) == false then
		if self:getAnimationTime(self.toggleAnimation.anim7) == 1 then
			self:playAnimation(self.toggleAnimation.anim7, -1, self:getAnimationTime(self.toggleAnimation.anim7), true)
		else
			self:playAnimation(self.toggleAnimation.anim7, 1, self:getAnimationTime(self.toggleAnimation.anim7), true)
		end
	else
		self:stopAnimation(self.toggleAnimation.anim7, true)
	end
end

function toggleAnimation.actionEventTA_anim8(self, actionName, inputValue, callbackState, isAnalog)
	if self:getIsAnimationPlaying(self.toggleAnimation.anim8) == false then
		if self:getAnimationTime(self.toggleAnimation.anim8) == 1 then
			self:playAnimation(self.toggleAnimation.anim8, -1, self:getAnimationTime(self.toggleAnimation.anim8), true)
		else
			self:playAnimation(self.toggleAnimation.anim8, 1, self:getAnimationTime(self.toggleAnimation.anim8), true)
		end
	else
		self:stopAnimation(self.toggleAnimation.anim8, true)
	end
end

function toggleAnimation.actionEventTA_anim9(self, actionName, inputValue, callbackState, isAnalog)
	if self:getIsAnimationPlaying(self.toggleAnimation.anim9) == false then
		if self:getAnimationTime(self.toggleAnimation.anim9) == 1 then
			self:playAnimation(self.toggleAnimation.anim9, -1, self:getAnimationTime(self.toggleAnimation.anim9), true)
		else
			self:playAnimation(self.toggleAnimation.anim9, 1, self:getAnimationTime(self.toggleAnimation.anim9), true)
		end
	else
		self:stopAnimation(self.toggleAnimation.anim9, true)
	end
end

function toggleAnimation.actionEventTA_anim10(self, actionName, inputValue, callbackState, isAnalog)
	if self:getIsAnimationPlaying(self.toggleAnimation.anim10) == false then
		if self:getAnimationTime(self.toggleAnimation.anim10) == 1 then
			self:playAnimation(self.toggleAnimation.anim10, -1, self:getAnimationTime(self.toggleAnimation.anim10), true)
		else
			self:playAnimation(self.toggleAnimation.anim10, 1, self:getAnimationTime(self.toggleAnimation.anim10), true)
		end
	else
		self:stopAnimation(self.toggleAnimation.anim10, true)
	end
end