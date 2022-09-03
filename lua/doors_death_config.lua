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
	
        if attacker:GetClass() == "worldspawn" then
            
            phrases = {

                { time = 10, text = "CLOSE_DEATH_SCREEN" },
                { time = 5, text = "Was that an accident?" },
                { time = 0, text = "You died to world..." }
                    
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