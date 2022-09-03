util.AddNetworkString("DoorsDeath_HandleDeath")


hook.Add( "PlayerDeath", "DoorsDeathScreen", function( victim, inflictor, attacker )

    net.Start("DoorsDeath_HandleDeath")
        net.WriteEntity(inflictor)
        net.WriteEntity(attacker)
    net.Send(victim)

end )


hook.Add("PlayerDeathSound", "DoorsDeathRemoveStandardBeep", function()
    return false
end)