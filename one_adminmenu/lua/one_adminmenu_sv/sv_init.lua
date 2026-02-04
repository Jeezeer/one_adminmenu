
util.AddNetworkString("OneAdminMenu.Open")

local function CanOpenAdminMenu(ply)
    if not IsValid(ply) then return false end
    return ONE_ADMIN.AllowedGroups[ply:GetUserGroup()] == true
end

hook.Add("PlayerSay", "OneAdminMenu_ChatCommand", function(ply, text)
    text = string.Trim(string.lower(text))

    if text == ONE_ADMIN.Command then
        if not CanOpenAdminMenu(ply) then
            ply:ChatPrint("⛔ Accès refusé.")
            return ""
        end

        net.Start("OneAdminMenu.Open")
        net.Send(ply)
        return ""
    end
end)

concommand.Add("one_adminmenu", function(ply)
    if not CanOpenAdminMenu(ply) then return end

    net.Start("OneAdminMenu.Open")
    net.Send(ply)
end)
