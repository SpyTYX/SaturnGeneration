local isOnWindows = package.config:sub(1, 1) == "\\"
local scm = require("modules.scramble")
local nom = require("modules.number")
local nor = require("modules.normal")
local cip = require("modules.cipher")
local cib = require("modules.cipherbeta")
local uui = require("modules.uuid")
local gui = require("modules.guid")
local sec = require("modules.secureseed")
local startupText = require("assets.startuptext")

function handleCommand(input)
    local command, args = input:match("^(%S+)%s*(.*)$")

    if command then
        if command == "use" then
            handleUseCommand(args)
        elseif command == "discord" then
            handleDiscordCommand(args)
        elseif command == "list" then
            handleListCommand(args)
        elseif command == "github" then
            handleGithubCommand(args)
        elseif command == "credits" then
            handleCreditsCommand(args)
        else
            print("Unknown command: " .. command)
        end
    end
end

function handleUseCommand(args)
    if args == "Normal" then
        io.write("Should there be numbers (true or false): ")
        local uir = io.read()
        if uir == true then 
            print("Generation: " .. nor.getCharacters(true))
        else 
            print("Generation: " .. nor.getCharacters(false))
        end
    elseif args == "Number" then
        local min;local max
        io.write("How many minimum characters should it have? (number): ")
        local uir1 = io.read()
        min = uir1
        io.write("How many maximum characters should it have? (number): ")
        local uir2 = io.read()
        max = uir2
        print("Generation: " .. nom.genNumber(min, max))
    elseif args == "UUID" then
        print("Generation: " .. uui.fetchUUID())
    elseif args == "GUID" then
        print("Generation: " .. gui.fetchGUID())
    elseif args == "SecureSeed" then
        print("Generation: " .. sec.getSeed())
    elseif args == "Cipher" then
        print("Generation: " .. cip.returncipher())
    elseif args == "CipherBeta" then
        print("Generation: " .. cib.returncipher())
    end
end

function handleDiscordCommand(args)
    print("Fetching Discord Invite...")
    print("Discord Invite: {DISCORD}")
end

function handleListCommand(args)
    print[[
            Listing Generation Methods
            - Normal | Generates Characters (or numbers too) randomly | Both, Numberless
            - Number | Generates a random number | Minimum, Maximum
            - UUID | Gets a random UUID from the WEB
            - GUID | Gets a random GUID from the WEB
            - SecureSeed | Generates a random Noxiseed Value (100+ numbers)
            - Cipher | Generates a random CeaserCipher code
            - CipherBeta | Generates a random CeaserCipher code with XOL and BitXO32
    ]]
end

function handleCreditsCommand(args)
    print[[
            Credits
            - Moonzy
            - - Main Developer (i coded everything)
            
            Programs Used
            - LUA
            - VBScript
            - BAT
    ]]
end

function handleGithubCommand(args)
    print("Fetching GitHub Invite...")
    print("GitHub Invite: {GITHUB}}")
end

while true do
    io.write("Enter a command: ")
    local userInput = io.read()

    handleCommand(userInput)
end