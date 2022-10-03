
surface.CreateFont("DoorsDeathScreen_tips", {
	font = "Nunito",
	extended = true,
	size = ScreenScale(40),
})


local function LerpColor(t, colorfrom, colorto )

	local r = Lerp( t, colorfrom.r, colorto.r)
	local g = Lerp( t, colorfrom.g, colorto.g)
	local b = Lerp( t, colorfrom.b, colorto.b)
	local a = Lerp( t, colorfrom.a, colorto.a)

	return Color(r, g, b, a)

end

CreateClientConVar( "doorsdeathscreen_stopsound", "1", true, false)


local deathMusic

function DeathScreen(attacker)

	RunConsoleCommand("dsp_off", 1)

	local phrases = DoorsDeathMenu.HandlePhrases(attacker)

	local bgColor = Color(25, 0, 0)

	local noiseMaterial = Material("doors/noise.png", "noclamp smooth")

	local youDied = Material("doors/you_died.png") 

	local BG = vgui.Create("DPanel") 
	BG:SetSize(ScrW(), ScrH())  

	local startTime = SysTime()


	local from = 500
	local to = 1000	

	surface.PlaySound( "doorsrblx/deathSound.wav" )

	timer.Simple(1.1, function()
		
		if IsValid(deathMusic) then
			deathMusic:Stop()
		end

		deathMusic = CreateSound( LocalPlayer(), "doorsrblx/guiding_lights.wav")
		deathMusic:Play()

	end)


	local lastChosen = ""
	local lastChosenTime = 0
	local textStartTime = 0
	local closingStartTime = 0
	local closing = false
	local aliveCheckAllowed = false

	timer.Simple(0.4, function()
		aliveCheckAllowed = true
	end)

	BG.Paint = function(s, w, h) 		
		
		if LocalPlayer():Alive() and (not closing) and aliveCheckAllowed then

			deathMusic:Stop()

			timer.Simple(0.05, function()
				surface.PlaySound( "doorsrblx/deathScreenEnd.wav" )
				RunConsoleCommand("dsp_off", 0)
			end)
	
	
			closing = true
			closingStartTime = SysTime()
	
			timer.Simple(1.7, function()
				BG:Remove()
			end)

		end


		draw.RoundedBox(0, 0, 0, w, h, bgColor)

		local diedTextX
		local diedTextY

		local textTransparency = 255

		local diedTextSpeed = 5

		if (SysTime() - startTime) < 2.2 then

			diedTextX = Lerp( (SysTime() - startTime) * diedTextSpeed, (ScrW() / 1.875) * 30, (ScrW() / 1.875) )
			diedTextY = Lerp( (SysTime() - startTime) * diedTextSpeed, (ScrH() / 2.8125) * 30, (ScrH() / 2.8125) )

		else

			local newTime = (SysTime() - startTime) - 2.2

			diedTextX = math.Clamp((ScrW() / 1.875) + ((ScrW() / 1.875) * 7 - (ScrW() / 1.875)) * math.ease.InOutCubic(newTime), 0, (ScrW() / 1.875) * 7)
			diedTextY = math.Clamp((ScrH() / 2.8125) + ((ScrH() / 2.8125) * 7 - (ScrH() / 2.8125)) * math.ease.InOutCubic(newTime), 0, (ScrH() / 2.8125) * 7)

			textTransparency = math.Clamp(255 + (0 - 255) * newTime / 1.1, 0, 255)	
			
			if closing then
				bgColor = LerpColor(SysTime() - closingStartTime, Color(0, 30, 48, 255), Color(0, 30, 48, 0) )
			else	
				bgColor = LerpColor( newTime, Color(25, 0, 0), Color(0, 30, 48) )
			end



			//

				for k, v in pairs(phrases) do
					
					if v.time > newTime or v.time < lastChosenTime then continue end

					local chosenPhrase = v.text
					lastChosenTime = v.time

					if chosenPhrase ~= lastChosen then
						textStartTime = SysTime()
					end

					if chosenPhrase == "CLOSE_DEATH_SCREEN" and not closing then
						
						deathMusic:Stop()

						timer.Simple(0.05, function()
							surface.PlaySound( "doorsrblx/deathScreenEnd.wav" )
						end)


						closing = true
						closingStartTime = SysTime()

						timer.Simple(1.7, function()
							BG:Remove()
							closing = false
						end)

					else
						if closing then return end

						lastChosen = chosenPhrase

						local textColor = LerpColor((SysTime() - textStartTime) * 0.5, Color(161,247,255,0), Color(161,247,255,255))

						local radius = 45
				
						local textRotationSpeed = 0.001
				
						local textx = math.sin( Lerp( (newTime * textRotationSpeed) % 1, 0, 360 ) ) * radius
						local texty = math.cos( Lerp( (newTime * textRotationSpeed) % 1, 0, 360 ) ) * radius
				
						draw.DrawText(chosenPhrase, "DoorsDeathScreen_tips", w / 2 + textx, h / 2 + texty - (ScrH() * 0.10), textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

					end

				end

			//


		end


		surface.SetDrawColor( 255, 255, 255, textTransparency )
		surface.SetMaterial( youDied )  
		surface.DrawTexturedRectRotated( w / 2, h / 2, diedTextX, diedTextY,  math.sin( (SysTime() - startTime) * 55 ) * math.Clamp( 10 + (0 - 10) * math.ease.OutQuint((SysTime() - startTime) / 3.5), 0, 10 ) )
		
		surface.SetDrawColor( 255, 255, 255, 10.75 )
		surface.SetMaterial( noiseMaterial )  
		surface.DrawTexturedRectUV( -w * 2 + math.random(0, w), 0, w * 30, h, 0, 0, w / 420, h / 420 )

		
	end


end


net.Receive("DoorsDeath_HandleDeath", function()
	local inflictor = net.ReadEntity()
	local attacker = net.ReadEntity()

	DeathScreen(attacker, inflictor)
end)