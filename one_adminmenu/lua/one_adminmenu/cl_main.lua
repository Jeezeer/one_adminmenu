
net.Receive("OneAdminMenu.Open", function()
    if IsValid(ONE_ADMIN_FRAME) then ONE_ADMIN_FRAME:Remove() end
    ONE_ADMIN_FRAME = vgui.Create("OneAdminMenu")
end)
