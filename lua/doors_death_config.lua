DoorsDeathMenu = DoorsDeathMenu or {}




/* 

 ALL PHRASES GOES FROM DOWN TO TOP!

 example = {
    {time = 10, text = "CLOSE_DEATH_SCREEN"},
    {time = 5, text = "You are dead!"},
    {time = 0, text = "Hello!"}
 }

 time = SHOWS HOW MUCH TIME MUST BE ELAPSED (in seconds) FROM THE MOMENT OF DEATH TO SHOW PHRASE
 text = PHRASE TEXT

 Always set "CLOSE_DEATH_SCREEN" in the top, otherwise death screen cannot be removed!

*/


function DoorsDeathMenu.HandlePhrases(attacker, inflictor)
 
	local phrases

	if attacker:IsPlayer() then -- If is player

		if attacker:Name() == LocalPlayer():Name() then -- If yourself

			phrases = {

				{ time = 10, text = "CLOSE_DEATH_SCREEN" }, -- Closing death screen
				{ time = 5, text = "Was that an suicide?" }, -- Some text
				{ time = 0, text = "You died by yourself..." } -- Some text
				
			}


		else

			
			phrases = {

				{ time = 10, text = "CLOSE_DEATH_SCREEN" },
                { time = 5, text = "Be careful!" },
				{ time = 0, text = "You died to " .. attacker:Name() .. "..." }
				
			}


		end

	else

        if not IsValid(attacker) then
         
            phrases = {
                    
                { time = 14, text = "CLOSE_DEATH_SCREEN" },
                { time = 7, text = "How did this even happen?" },
                { time = 0, text = "That is odd. I cannot figure out who\nyou died to." } 
    
            }
    
        elseif attacker:GetClass() == "worldspawn" then
            
            phrases = {

                { time = 10, text = "CLOSE_DEATH_SCREEN" },
                { time = 5, text = "Was that an accident?" },
                { time = 0, text = "You died to world..." }
                    
            }

        elseif attacker:GetClass() == "npc_rush" or attacker:GetClass() == "npc_livelandr_rush" or attacker:GetClass() == "npc_drg_rushdoors" 
        or attacker:GetClass() == "l55_drgdoors_rush" 
        then
             
            phrases = {
                 
                { time = 15, text = "CLOSE_DEATH_SCREEN" },
                { time = 5, text = "Pay attention to any cues that might\nhint at its arrival." },
                { time = 0, text = "You died to Rush..." }

            } 

        elseif attacker:GetClass() == "npc_glitch" then

            phrases = {
                
                { time = 21, text = "CLOSE_DEATH_SCREEN" },
                { time = 15, text = "Stay close together!" },
                { time = 7, text = "However, I did notice you lagged\nback from your friends." },
                { time = 0, text = "That is odd. I cannot figure out who\nyou died to." } 

            }

        
        elseif attacker:GetClass() == "npc_ambush" or attacker:GetClass() == "npc_livelandr_ambush" or attacker:GetClass() == "npc_drg_ambushdoors"
            or attacker:GetClass() == "l55_drgdoors_ambush"
        then

            phrases = {
                
                { time = 21, text = "CLOSE_DEATH_SCREEN" },
                { time = 15, text = "Use what you have learned from\nRush!" },
                { time = 7, text = "It is a tricky one." },
                { time = 0, text = "You died to who you call Ambush..." } 

            }

        elseif attacker:GetClass() == "npc_drg_seek" or attacker:GetClass() == "npc_seek" or attacker:GetClass() == "l55_drgdoors_seek" then
            
            phrases = {
                
                { time = 15, text = "CLOSE_DEATH_SCREEN" },
                { time = 7, text = "Run from him as fast as you can!" },
                { time = 0, text = "You were caught by Seek..." } 

            }

        elseif attacker:GetClass() == "npc_jack" or attacker:GetClass() == "l55_drgdoors_jack" then
            
            phrases = {
                
                { time = 15, text = "CLOSE_DEATH_SCREEN" },
                { time = 7, text = "Just... How?!" },
                { time = 0, text = "You died to Jack..." } 

            }

        elseif attacker:GetClass() == "npc_livelandr_eyes" or attacker:GetClass() == "l55_drgdoors_eyes" then
            
            phrases = {
                
                { time = 15, text = "CLOSE_DEATH_SCREEN" },
                { time = 7, text = "They don't like to be stared at." },
                { time = 0, text = "You died to the Eyes..." } 

            }

        elseif attacker:GetClass() == "l55_drgdoors_figure" then
            
            phrases = {
                
                { time = 15, text = "CLOSE_DEATH_SCREEN" },
                { time = 7, text = "It cannot see, but it will use sounds\nand vibrations to its advantage." },
                { time = 0, text = "You died to who you call Figure..." } 

            }

        elseif attacker:GetClass() == "l55_drgdoors_screech" then
            
            phrases = {
                
                { time = 22, text = "CLOSE_DEATH_SCREEN" },
                { time = 15, text = "If you suspect that it is around, look\nfor it and stare it down." },
                { time = 7, text = "It likes to lurk in dark rooms." },
                { time = 0, text = "You died to Screech..." } 

            }

        elseif attacker:GetClass() == "l55_drgdoors_seek_arm" then
            
            phrases = {
                
                { time = 15, text = "CLOSE_DEATH_SCREEN" },
                { time = 7, text = "Tentacles 8)" },
                { time = 0, text = "You died to Seek's arm..." } 

            }

        elseif attacker:GetClass() == "l55_drgdoors_depths" or attacker:GetClass() == "l55_drgdoors_silence" then
            
            phrases = {
                
                { time = 22, text = "CLOSE_DEATH_SCREEN" },
                { time = 15, text = "Well... Uh... I don't know who is it..." },
                { time = 7, text = "It looks like i must know who it is..." },
                { time = 0, text = "Wait..." } 

            }

        elseif attacker:GetClass() == "l55_drgdoors_closet" then

            phrases = {
                
                { time = 22, text = "CLOSE_DEATH_SCREEN" },
                { time = 15, text = "You may need to hop in and out of a\nhiding spot repeatedly to avoid Hide." },
                { time = 7, text = "Minimize the time you spend hiding." },
                { time = 0, text = "You died to Hide..." } 

            }

        elseif attacker:GetClass() == "npc_zetaplayer" then

            phrases = {
                
                { time = 22, text = "CLOSE_DEATH_SCREEN" },
                { time = 15, text = "Be careful! Their actions cannot be predicted!" },
                { time = 7, text = "It looks like this is not a real player... " },
                { time = 0, text = "You died to " .. attacker:GetNW2String('zeta_name') .. "..." } 

            }

        elseif attacker:GetClass() == "doors_room" then -- 8)
            
            phrases = {
                
                { time = 29, text = "CLOSE_DEATH_SCREEN" },
                { time = 22, text = "Either you are Livelandr,\n or you just peeked into the config." },
                { time = 17, text = "Ok. No more questions." },
                { time = 10, text = "How the hell you died from it?" },
                { time = 5, text = "doors_room?" },
                { time = 0, text = "You died to... what..?" } 

            }

        else

            phrases = {

                { time = 10, text = "CLOSE_DEATH_SCREEN" },
                { time = 5, text = "Be careful!" },
                { time = 0, text = "You died to " .. attacker:GetClass() .. "..." }
                    
            }	

        end



	end

	return phrases
	
end