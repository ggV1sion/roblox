local r = {"BreathingHAMON", "TeleportDetect", "JJARC", "TakePoisonDamage", "CHECKER_1", "CHECKER", "GUI_CHECK",
           "OneMoreTime", "checkingSPEED", "BANREMOTE", "PERMAIDBAN", "KICKREMOTE", "BR_KICKPC", "FORCEFIELD",
           "Christmas_Sock", "VirusCough", "Symbiote", "Symbioted"}
local n;
n = hookmetamethod(game, "__namecall", function(...)
    local a = {...}
    if table.find(r, a[2]) then
        return
    end
    return n(table.unpack(a))
end)
