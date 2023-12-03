local build_0_32_0_return = {}

local data = {
    ["HOLD"] = {
        ["GUIDAPI"] = "https://www.uuidgenerator.net/api/guid"
    };
    ["SEND"] = {
        ["RETURNCIPHER"] = ""
    };
}

function build_0_32_0_return.fetchGUID()
    local url = data["HOLD"]["GUIDAPI"]
    if url then
        local command = "curl -s " .. tostring(url)
        local handle = io.popen(command)
        local result = handle:read("*a")
        handle:close()

        if result and result ~= "" then
            return tostring(result)
        else
            return "Failed to retrieve GUID"
        end
    end
end

return build_0_32_0_return