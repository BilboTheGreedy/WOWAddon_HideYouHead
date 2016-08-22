HUH_SavedVars = {
	toggle = true,
	auto = true
}

local HUHFrame = CreateFrame("Frame")

function HUHFrame:OnEvent(event, addon)

		if event == "ADDON_LOADED" or event == "PLAYER_LOGIN" and HUH_SavedVars.auto then
		HUH_SavedVars.toggle = false
		end	
		
		if addon == "Blizzard_TalkingHeadUI" then
			hooksecurefunc("TalkingHeadFrame_PlayCurrent", function()
			if HUH_SavedVars.auto then 
				TalkingHeadFrame:Hide()
					if HUH_SavedVars.toggle then
						TalkingHeadFrame:Show()
					else 
						print("Hide You Head!")
					end
		else
			if HUH_SavedVars.toggle then
					TalkingHeadFrame:Show()
				else 
					print("Hide You Head!")
					TalkingHeadFrame:Hide()
				end
			end
		end)
			self:UnregisterEvent(event)
	end
end
HUHFrame:RegisterEvent("ADDON_LOADED")
HUHFrame:RegisterEvent("PLAYER_LOGIN")
HUHFrame:SetScript("OnEvent", HUHFrame.OnEvent)

SLASH_HUH1 = '/huh';
local function handler(msg, editbox)
 local command = msg:match("^(%S*)%s*(.-)$");
 if command == "toggle" then
    if HUH_SavedVars.toggle then
		  TalkingHeadFrame:Hide();
		  HUH_SavedVars.toggle = false
		  print("Hidden");
	else
		  TalkingHeadFrame:Show();
		  HUH_SavedVars.toggle = true
		  print("Visible")
  end
  elseif command == "auto" then
	  if HUH_SavedVars.auto then
		  HUH_SavedVars.auto = false
		  print("Auto Hide Persistent false")
	  else
		  HUH_SavedVars.auto = true
		  print("Auto Hide Persistent true")
end
 else
      print(GetAddOnMetadata("HideYouHead", "Title"), 'version ' .. GetAddOnMetadata("HideYouHead", "Version")
	,"\n",
	"/huh toggle - Hide/Show Talking Head Frame"
	,"\n",
	"/huh auto - if set to true then toggle will be set to hidden when you login");
	if HUH_SavedVars.toggle then
	DEFAULT_CHAT_FRAME:AddMessage("Talking Head: \124cff00ff00\124hVisible\124h\124r");
	else
	DEFAULT_CHAT_FRAME:AddMessage("Talking Head: \124cffff0000\124hHidden\124h\124r");
	end
	if HUH_SavedVars.auto then
	DEFAULT_CHAT_FRAME:AddMessage("Auto Hide at Logon: \124cff00ff00\124htrue\124h\124r");
	else
	DEFAULT_CHAT_FRAME:AddMessage("Auto Hide at Logon: \124cffff0000\124hfalse\124h\124r");
	end

 end
end
SlashCmdList["HUH"] = handler;
