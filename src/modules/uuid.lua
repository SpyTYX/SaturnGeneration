local build_0_32_0_return = {}

local data = {
    ["HOLD"] = {
        ["UUIDAPI"] = "https://www.uuidgenerator.net/api/version4"
    };
    ["SEND"] = {
        ["RETURNCIPHER"] = ""
    };
}

function build_0_32_0_return.fetchUUID()
    local url = data["HOLD"]["UUIDAPI"]
    if url then
        local command = "curl -s " .. url
        local handle = io.popen(command)
        local result = handle:read("*a")
        handle:close()

        if result and result ~= "" then
            return result
        else
            return "Failed to retrieve UUID"
        end
    end
end

return build_0_32_0_return