local returner = {}

math.randomseed(os.time())
ReturnerText = ""

local function generateText(option)
    local rand = math.random(1, 2)
    if option == true then return rand == 1 and string.char(math.random(65, 90)) or tostring(math.random(0, 9))
    else return string.char(math.random(65, 90))
    end
end

function returner.getCharacters(optionToSend)
    for i = 1, 50 do
        ReturnerText = ReturnerText .. generateText(optionToSend)
    end
    local ReturnerTextCopy = ReturnerText
    ReturnerText = ""
    return ReturnerTextCopy
end

return returner