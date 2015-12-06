SLASH_QUOTATION1, SLASH_QUOTATION2 = '/qt', '/quotation'
function SlashCmdList.QUOTATION(arg, i)
	if (arg == "config") then
		Quotation_Config:Show()
	elseif (arg == "quote") then
		local rand = math.random(1, table.getn(quoteList))
		local randomQuote = quoteList[rand]
		SendChatMessage(randomQuote , "SAY", nil, nil);
	else
		print("|cFFFFFF00".."Quotation usage:\r\n"..
			  "|cFF00FF00".."/qt config - |rOpens configuration - enter quotes separated by newlines\r\n"..
			  "|cFF00FF00".."/qt quote - |rChooses a random quote and /says it")
	end
end

function Initialise()
	debugPrint("|cFFFFFF00".."Started init...")
	local frame = CreateFrame("FRAME")
	frame:RegisterEvent("ADDON_LOADED")
	function frame:OnEvent(event, arg1)
		if event == "ADDON_LOADED" and arg1 == "Quotation" then
			debugPrint("Event! |cffff0000" .. event .. "|r - |cFF00FF00" .. arg1)
			print("|cFFFFFF00".."Quotation loaded!")
			if quoteList == nil then
				quoteList = {}
			else
				debugPrint("|cFFFFFF00".."Saved quotes found...")
				debugPrint("|cFFFFFF00".."List of saved quotes: ")				
				for i, str in pairs(quoteList) do
					debugPrint("|cFF00FF00 "..str)
				end
			end
			
			Quotation_EditQuotes:SetText(table.concat(quoteList, "\r\n"))
			debugPrint("|cFFFFFF00".."Initialisation complete!")
		end
	end
	frame:SetScript("OnEvent", frame.OnEvent)
end

function SaveQuotes()
	debugPrint("In SaveQuotes")
	local quotes = Quotation_EditQuotes:GetText()
	local splitQuotes = SplitStr(quotes)
	quoteList = splitQuotes
	print("|cFFFFFF00".."Quotation list saved!")
end