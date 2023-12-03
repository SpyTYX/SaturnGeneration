local returner = {}

math.randomseed(os.time())
ReturnerText = ""

local function genChar() return string.char(math.random(65, 90)) end

local function getNum()
    local tempFile = os.tmpname()
    local txm = math.random(101,998) or math.sin(3)
    local txl = math.random(999,1998) or math.sin(4)
    local calc = (txm + txl) + (101 + 998) * (998 + 1998) * 100
    os.execute("echo %PROCESSOR_LEVEL% > " .. tempFile)
    local processorLevel = io.open(tempFile, "r"):read("*a"):gsub("\n", "")
    os.remove(tempFile)

    local seed = os.time() + os.clock() + tonumber(processorLevel)
    math.randomseed(seed)

    return math.random(txl,calc)
end

function returner.getSeed()
    for i = 1, 7 do
        ReturnerText = ReturnerText .. getNum()
    end
    for i = 1, 35 do
        ReturnerText = ReturnerText .. genChar()
    end

    local ReturnerTextCopy = ReturnerText
    ReturnerText = ""
    return ReturnerTextCopy
end

return returner
