function PANEL:OpenWarnTab()

    self.Content:Clear()

    local scroll = vgui.Create("DScrollPanel", self.Content)
    scroll:Dock(FILL)

    for _, ply in ipairs(player.GetAll()) do
        local btn = vgui.Create("DButton", scroll)
        btn:SetTall(50)
        btn:Dock(TOP)
        btn:SetText(ply:Nick())
        btn.DoClick = function()
            net.Start("OneAdmin_GetWarns")
            net.WriteEntity(ply)
            net.SendToServer()
        end
    end
end

net.Receive("OneAdmin_GetWarns", function()
    local warns = net.ReadTable()
    PrintTable(warns)
end)
