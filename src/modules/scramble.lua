local _ = {}

function _.scrambleText(originalText, type)
    math.randomseed(os.time())

    local function shuffle(str)
        local length = #str
        local indices = {}
        for i = 1, length do
            indices[i] = i
        end

        for i = length, 2, -1 do
            local j = math.random(i)
            indices[i], indices[j] = indices[j], indices[i]
        end

        local result = {}
        for i = 1, length do
            result[i] = str:sub(indices[i], indices[i])
        end

        return table.concat(result)
    end

    local function removeSpecialCharacters(str)
        if tonumber(type) == 0 then return str:gsub("[%s_]", "")
        else return str:gsub("[%W_]", "")
        end
    end

    local scrambledText = shuffle(originalText)
    scrambledText = removeSpecialCharacters(scrambledText)

    return scrambledText
end

return _
