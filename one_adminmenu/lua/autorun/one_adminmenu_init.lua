ONE_ADMIN = ONE_ADMIN or {}

if SERVER then
    -- Envoi des fichiers au client
    AddCSLuaFile("one_adminmenu/sh_config.lua")
    AddCSLuaFile("one_adminmenu/cl_main.lua")
    AddCSLuaFile("one_adminmenu/cl_gui.lua")
    AddCSLuaFile("one_adminmenu/cl_tabs_players.lua")
    AddCSLuaFile("one_adminmenu/cl_tabs_awarn.lua")
    AddCSLuaFile("one_adminmenu/cl_tabs_logs.lua")

    -- Inclusion serveur
    include("one_adminmenu/sh_config.lua")    include("one_adminmenu_sv/sv_init.lua")
    include("one_adminmenu_sv/sv_awarn.lua")
    include("one_adminmenu_sv/sv_logs.lua")
else
    -- Inclusion client (C'est ce qui manquait)
    include("one_adminmenu/sh_config.lua")
    include("one_adminmenu/cl_gui.lua")
    include("one_adminmenu/cl_main.lua")
    include("one_adminmenu/cl_tabs_players.lua")
    include("one_adminmenu/cl_tabs_awarn.lua")
    include("one_adminmenu/cl_tabs_logs.lua")
end