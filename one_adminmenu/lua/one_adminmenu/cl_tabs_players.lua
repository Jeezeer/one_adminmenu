function PANEL:OpenPlayersTab()

    self.Content:Clear()

    local search = self:CreateSearchBar(self.Content)

    local scroll = vgui.Create("DScrollPanel", self.Content)
    scroll:Dock(FILL)

    local function RefreshPlayers(filter)
        scroll:Clear()

        for _, ply in ipairs(player.GetAll()) do
            if filter and not string.find(string.lower(ply:Nick()), filter) then continue end

            local card = vgui.Create("DPanel", scroll)
            card:SetTall(70)
            card:Dock(TOP)
            card:DockMargin(10,0,10,10)
            card.Paint = function(self,w,h)
                draw.RoundedBox(10,0,0,w,h,Color(22,28,32,220))
            end

            local avatar = vgui.Create("AvatarImage", card)
            avatar:SetSize(54,54)
            avatar:SetPos(8,8)
            avatar:SetPlayer(ply, 64)

            local name = vgui.Create("DLabel", card)
            name:SetFont("ONE_Text")
            name:SetText(ply:Nick().." ("..ply:GetUserGroup()..")")
            name:SetPos(70,10)
            name:SizeToContents()

            -- Actions ULX
            local function Action(txt, cmd)
                local b = vgui.Create("DButton", card)
                b:SetText(txt)
                b:SetSize(80,26)
                b:Dock(RIGHT)
                b:DockMargin(5,20,5,20)
                b.DoClick = function()
                    RunConsoleCommand("ulx", unpack(cmd))
                end
                b.Paint = function(self,w,h)
                    draw.RoundedBox(6,0,0,w,h,Color(0,255,170, self:IsHovered() and 80 or 40))
                end
            end

            Action("Goto", {"goto", ply:Nick()})
            Action("Bring", {"bring", ply:Nick()})
            Action("Jail", {"jail", ply:Nick(), "120"})
            Action("Slay", {"slay", ply:Nick()})
        end
    end

    RefreshPlayers()

    search.OnChange = function(self)
        RefreshPlayers(string.lower(self:GetValue()))
    end
end

