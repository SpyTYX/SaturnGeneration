local build_0_32_0_return = {}

local data = {
    ["HOLD"] = {
        ["STARTCIPHER"] = "";
        ["SHIFT"] = 3;
    };
    ["SEND"] = {
        ["RETURNCIPHER"] = "";
    };
}

math.randomseed(os.time())

local function generate()
    local rand = math.random(1, 2)
    return rand == 1 and string.char(math.random(65, 90)) or tostring(math.random(0, 9))
end

for i = 1, 30 do
    data["HOLD"]["STARTCIPHER"] = data["HOLD"]["STARTCIPHER"] .. generate()
end

function startcipher(__,___)
    local result = {}
    for i = 1, #__ do
        local char = __:byte(i)
        local encryptedChar = char + ___
        if char >= 32 and char <= 126 then
            while encryptedChar > 126 do
                encryptedChar = encryptedChar - 95
            end
            result[i] = string.char(encryptedChar)
        else
            result[i] = string.char(char)
        end
    end
    return table.concat(result)
end

data["SEND"]["RETURNCIPHER"] = startcipher(data["HOLD"]["STARTCIPHER"],-data["HOLD"]["SHIFT"])

function build_0_32_0_return.returncipher()
    return data["SEND"]["RETURNCIPHER"]
end

return build_0_32_0_return
