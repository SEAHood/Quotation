debugMode = false

function SplitStr(inputStr, sep)
	if sep == nil then
		sep = "\r\n"
	end
	local t={} ; i=1
	for str in string.gmatch(inputStr, "([^"..sep.."]+)") do
		debugPrint(str)
		t[i] = str
		i = i + 1
	end
	return t
end

function debugPrint(str)
	if debugMode then print(str) end
end