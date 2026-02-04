util.AddNetworkString("OneAdmin_GetWarns")
util.AddNetworkString("OneAdmin_AddWarn")

net.Receive("OneAdmin_GetWarns", function(_, ply)
    local target = net.ReadEntity()
    if not awarn then return end
    net.Start("OneAdmin_GetWarns")
    net.WriteTable(awarn:GetPlayerWarnings(target:SteamID64()) or {})
    net.Send(ply)
end)
