local PANEL = {}

function PANEL:Init()
    self:SetSize(ScrW()*0.85, ScrH()*0.85)
    self:Center()
    self:SetAlpha(0)
    self:AlphaTo(255, 0.25)
    self:MakePopup()
    self.start = SysTime()

    -- Sidebar    self.Sidebar = vgui.Create("DPanel", self)
    self.Sidebar:Dock(LEFT)
    self.Sidebar:SetWide(90)
    self.Sidebar.Paint = function(s, w, h)
        -- Optionnel : un fond légèrement plus sombre pour la barre latérale
        draw.RoundedBoxEx(12, 0, 0, w, h, Color(10, 10, 15, 150), true, false, true, false)
    end

    -- Content
    self.Content = vgui.Create("DPanel", self)
    self.Content:Dock(FILL)
    self.Content.Paint = function(s, w, h) 
        -- On laisse vide pour voir le fond du panel principal (EditablePanel)
    end
end

function PANEL:Paint(w, h)
    Derma_DrawBackgroundBlur(self, self.start)
    draw.RoundedBox(12, 0, 0, w, h, Color(15, 20, 25, 240))
end

function PANEL:BuildTabs()

    local function Tab(icon, func)
        local b = vgui.Create("DButton", self.Sidebar)
        b:SetTall(60)
        b:Dock(TOP)
        b:SetText("")
        b.DoClick = func
        b.Paint = function(self,w,h)
            draw.RoundedBox(8,10,10,w-20,h-20,Color(0,255,170, self:IsHovered() and 90 or 30))
        end
    end

    Tab("players", function() self:OpenPlayersTab() end)
    Tab("warn", function() self:OpenWarnTab() end)
end


vgui.Register("OneAdminMenu", PANEL, "EditablePanel")