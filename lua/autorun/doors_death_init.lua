if SERVER then
    
    AddCSLuaFile("doors_death_config.lua")
    AddCSLuaFile("doorsdeath/deathscreen.lua")
    resource.AddSingleFile("resource/fonts/nunito-regular.ttf")
    include("doorsdeath/sv_deathhandler.lua")

else

    include("doors_death_config.lua")
    include("doorsdeath/deathscreen.lua")

end