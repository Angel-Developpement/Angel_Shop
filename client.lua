Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", 10)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

local mainMenu = RageUI.CreateMenu("Angel Shop", "Shop By Angel")

function OpenMenu()
     if open then 
         open = false
         RageUI.Visible(mainMenu, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu, true)
         CreateThread(function()
         while open do 


            RageUI.IsVisible(mainMenu,function() 

                RageUI.Separator("↓ ~b~Boisson~w~ ↓")

				RageUI.Button("Eau", "Voici de l'eau fraîche", {RightLabel = "~g~3$"}, true , {
					onSelected = function()
						TriggerServerEvent('angel_shop:BuyEau')	
					end
				})

                RageUI.Button("Soda", "Voici du Soda bien frais", {RightLabel = "~g~3$"}, true , {
					onSelected = function()
						TriggerServerEvent('angel_shop:Buysoda')	
					end
				})

                RageUI.Separator("↓ ~r~Nourritures~w~ ↓")

                RageUI.Button("Pain", "Voici du pain frais", {RightLabel = "~g~3$"}, true , {
					onSelected = function()
						TriggerServerEvent('angel_shop:BuyPain')
					end
				})

                RageUI.Button("Bol de pistache", "Voici un bol de pistaches", {RightLabel = "~g~3$"}, true , {
					onSelected = function()
						TriggerServerEvent('angel_shop:Buybolpistache')
					end
				})

            end)
          Wait(0)
         end
      end)
   end
end

local position = {
    {x = -707.41, y = -914.04, z = 19.22, },
    {x = 1135.53, y = -982.07, z = 46.42, },
    {x = 1163.56, y = -323.71, z = 69.21, },
    {x = 373.94, y = 326.69, z = 103.57, },
    {x = 2557.3, y = 382.11, z = 108.62, },
    {x = -3039.85, y = 585.59, z = 7.91, },
    {x = -3241.91, y = 1001.42, z = 12.83, },
    {x = 547.65, y = 2670.88, z = 42.16, },
    {x = 1961.41, y = 3740.89, z = 32.34, },
    {x = 2679.02, y = 3280.67, z = 55.24, },
    {x = 1729.17, y = 6414.94, z = 35.04, },
    {x = -1222.85, y = -907.05, z = 12.33, },
    {x = -1487.17, y = -379.83, z = 40.16, },
    {x = -2968.41, y = 390.05, z = 15.04, },
    {x = 1166.41, y = 2709.31, z = 38.16, },
    {x = -48.52, y = -1757.29, z = 29.42, },
    {x = -1820.86, y = 792.52, z = 138.12, },
    {x = 1698.44, y = 4924.39, z = 42.06, }
}   

Citizen.CreateThread(function()
    while true do
        NearZone = false

        for k,v in pairs(position) do

				local interval = 1
            	local pos = GetEntityCoords(GetPlayerPed(-1), false)
            	local dest = vector3(v.x, v.y, v.z)
            	local distance = GetDistanceBetweenCoords(pos, dest, true)
            	if distance > 2 then
                	interval = 1
            	else
                	interval = 1

                	local dist = Vdist(pos.x, pos.y, pos.z, position[k].x, position[k].y, position[k].z)
                	NearZone = true 

                	if distance < 3 then
                    	if not InAction then 
						Visual.Subtitle("Appuyer sur ~g~[E]~s~ pour ouvrir le menu", 0) 
                    end
                    if IsControlJustReleased(1,51) then
                        OpenMenu()
                    end
                end
                break
            end
        end
        if not NearZone then 
            Wait(500)
        else
            Wait(1)
        end
    end
end)

local blips = {
    {title="Angel Shop", colour=2, id=59, x = -707.41, y = -914.04, z = 19.22},
    {title="Angel Shop", colour=2, id=59, x = 1135.63, y = -982.07, z = 46.42},
    {title="Angel Shop", colour=2, id=59, x = 1163.56, y = -323.71, z = 69.21},
    {title="Angel Shop", colour=2, id=59, x = 373.94, y = 326.69, z = 103.57},
    {title="Angel Shop", colour=2, id=59, x = 2557.3, y = 382.11, z = 108.62},
    {title="Angel Shop", colour=2, id=59, x = -3039.85, y = 585.59, z = 7.91},
    {title="Angel Shop", colour=2, id=59, x = -3241.91, y = 1001.42, z = 12.83},
    {title="Angel Shop", colour=2, id=59, x = 547.65, y = 2670.88, z = 42.16},
    {title="Angel Shop", colour=2, id=59, x = 1961.41, y = 3740.89, z = 32.34},
    {title="Angel Shop", colour=2, id=59, x = 2679.02, y = 3280.67, z = 55.24},
    {title="Angel Shop", colour=2, id=59, x = 1729.17, y = 6414.94, z = 35.04},
    {title="Angel Shop", colour=2, id=59, x = -1222.85, y = -907.05, z = 12.33},
    {title="Angel Shop", colour=2, id=59, x = -1487.17, y = -379.83, z = 40.16},
    {title="Angel Shop", colour=2, id=59, x = -2968.41, y = 390.05, z = 15.04},
    {title="Angel Shop", colour=2, id=59, x = 1166.41, y = 2709.31, z = 38.16},
    {title="Angel Shop", colour=2, id=59, x = -48.52, y = -1757.29, z = 29.42},
    {title="Angel Shop", colour=2, id=59, x = -1820.86, y = 792.52, z = 138.12},
    {title="Angel Shop", colour=2, id=59, x = 1698.44, y = 4924.39, z = 42.06}
}


Citizen.CreateThread(function()

for _, info in pairs(blips) do
  info.blip = AddBlipForCoord(info.x, info.y, info.z)
  SetBlipSprite(info.blip, info.id)
  SetBlipDisplay(info.blip, 4)
  SetBlipScale(info.blip, 0.7)
  SetBlipColour(info.blip, info.colour)
  SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(info.title)
  EndTextCommandSetBlipName(info.blip)
end
end)