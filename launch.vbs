On Error Resume Next
Dim objShell, luaCheck
Set objShell = WScript.CreateObject("WScript.Shell")

strCurrentDirectory = objShell.CurrentDirectory
luaCheck = objShell.Run("lua -v", 0, True)

If luaCheck = 0 Then
    objShell.Run "mshta ""javascript:var sh=new ActiveXObject('WScript.Shell');sh.Popup('Launching Saturn Generation', 1, 'Saturn Launcher', 64);close();""", 0, False
    objShell.CurrentDirectory = objShell.ExpandEnvironmentStrings(strCurrentDirectory & "\src")
    WScript.Sleep 1500

    objShell.Run "main.lua", 1, True
Else
    objShell.Run "mshta ""javascript:var sh=new ActiveXObject('WScript.Shell');sh.Popup('Sorry! LUA is not installed on your computer. Go to https://lua.org to install and add LUA to your environment table.', 10, 'Saturn Launcher', 16);close();""", 0, True
    objShell.Run "pause", 1, True
End If

objShell.CurrentDirectory = strCurrentDirectory

