local cooldown = false

Citizen.CreateThread(function ()
  while true do
       Citizen.Wait(5)
       if cooldown == true then
       Citizen.Wait(5000)
cooldown = false
       end
  end
end)

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu('~u~Véhicule', 'Options Véhicule')
_menuPool:Add(mainMenu)

function engine(menu)
  local enginevehicle = _menuPool:AddSubMenu(menu, "Moteur", '')
  local on = NativeUI.CreateItem("Démarrer Moteur", '')
  local off = NativeUI.CreateItem("Éteindre Moteur", '')
  
  enginevehicle:AddItem(on)
  enginevehicle:AddItem(off)
  
  enginevehicle.OnItemSelect = function(sender, item, index)
  
  if item == on then
    notify("Vous avez ~b~démarrer~w~ le moteur.")
    if SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()), true, false, true) then
    SetVehicleUndriveable(GetVehiclePedIsIn(PlayerPedId()), true)
  end
  end
  
  if item == off then
    notify("Vous avez ~r~éteint~w~ le moteur.")
    if SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()), false, false, true) then
    SetVehicleUndriveable(GetVehiclePedIsIn(PlayerPedId()), false)
  end
  end
  end  
  end

  function doors(menu)
    local doors = _menuPool:AddSubMenu(menu, "Portes", '')
    local frontleft = NativeUI.CreateItem("Porte Avant Gauche", '')
    local frontright = NativeUI.CreateItem("Porte Avant Droite", '')
    local backLeft = NativeUI.CreateItem("Porte Arrière Gauche", '')
    local backright = NativeUI.CreateItem("Porte Arrière Droite", '')
    local trunk = NativeUI.CreateItem("Coffre", '')
    local hood = NativeUI.CreateItem("Capot", '')
    
    doors:AddItem(frontleft)
    doors:AddItem(frontright)
    doors:AddItem(backLeft)
    doors:AddItem(backright)
    doors:AddItem(trunk)
    doors:AddItem(hood)
    
    doors.OnItemSelect = function(sender, item, index)
    
    if item == frontleft then
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    local isopen = GetVehicleDoorAngleRatio(veh,0)
    
    if isopen  == 0 then
    SetVehicleDoorOpen(veh, 0, false, false )
    else 
      SetVehicleDoorShut(veh, 0, false)
    end
    end
    
    if item == frontright then
      local ped = PlayerPedId()
      local veh = GetVehiclePedIsIn(ped, false)
      local isopen = GetVehicleDoorAngleRatio(veh,1)
    
      if isopen  == 0 then
      SetVehicleDoorOpen(veh, 1, false, false )
      else 
      SetVehicleDoorShut(veh, 1, false)
      end
      end
      if item == backLeft then
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        local isopen = GetVehicleDoorAngleRatio(veh,2)
    
        if isopen  == 0 then
        SetVehicleDoorOpen(veh, 2, false, false )
        else 
        SetVehicleDoorShut(veh, 2, false)
        end
        end
    
        if item == backright then
          local ped = PlayerPedId()
          local veh = GetVehiclePedIsIn(ped, false)
          local isopen = GetVehicleDoorAngleRatio(veh,3)
    
          if isopen  == 0 then
          SetVehicleDoorOpen(veh, 3, false, false )
          else 
          SetVehicleDoorShut(veh, 3, false)
          end
          end
      
    if item == trunk then
      local ped = PlayerPedId()
      local veh = GetVehiclePedIsIn(ped, false)
      local isopen = GetVehicleDoorAngleRatio(veh,5)
    
      if isopen  == 0 then
      SetVehicleDoorOpen(veh, 5, false, false )
      else 
      SetVehicleDoorShut(veh, 5, false)
      end
      end
    
      if item == hood then
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        local isopen = GetVehicleDoorAngleRatio(veh,4)
    
        if isopen  == 0 then
        SetVehicleDoorOpen(veh, 4, false, false )
        else 
        SetVehicleDoorShut(veh, 4, false)
        end
        end
    end
    end

function seatrs(menu)
  local seats = _menuPool:AddSubMenu(menu, "Sièges", '',1420,0)
  local ped = PlayerPedId()
  local veh = GetVehiclePedIsIn(ped)
  local hash = GetEntityModel(veh)
  local max = GetVehicleModelNumberOfSeats(hash)

  if max >= 4 then
local dr = NativeUI.CreateItem("Siège Conducteur", '')
local pass = NativeUI.CreateItem("Siège Passanger", '')
local rl = NativeUI.CreateItem("Siège Arrière Gauche", '')
local rr = NativeUI.CreateItem("Siège Arrière Droit", '')
seats:AddItem(dr)
seats:AddItem(pass)
seats:AddItem(rl)
seats:AddItem(rr)
  
seats.OnItemSelect = function(sender, item, index)
  if item == dr then
  TaskWarpPedIntoVehicle(ped, veh, -1)
end
if item == pass then
  TaskWarpPedIntoVehicle(ped, veh, 0)

end
if item == rl then
  TaskWarpPedIntoVehicle(ped, veh, 1)
end
if item == rr then
  TaskWarpPedIntoVehicle(ped, veh, 2)
end
end

else if max < 4 then
  local dr = NativeUI.CreateItem("Siège Conducteur", '')
  local pass = NativeUI.CreateItem("Siège Passanger", '')
  seats:AddItem(dr)
  seats:AddItem(pass)

  seats.OnItemSelect = function(sender, item, index)
        if item == dr then
      TaskWarpPedIntoVehicle(ped, veh, -1)
    end
    if item == pass then
    TaskWarpPedIntoVehicle(ped, veh, 0)

  end
end
end
end
end

function windows(menu)
local windows = _menuPool:AddSubMenu(menu, "Fenêtres", '')
local frontup = NativeUI.CreateItem("Descendre Fenêtres Avant", '')
local frontdown = NativeUI.CreateItem("Monter Fenêtres Avant", '')
local backtup = NativeUI.CreateItem("Descendre Fenêtres Arrière", '')
local backdown = NativeUI.CreateItem("Monter Fenêtres Arrière", '')

windows:AddItem(frontup)
windows:AddItem(frontdown)
windows:AddItem(backtup)
windows:AddItem(backdown)

windows.OnItemSelect = function(sender, item, index)

if item == frontup then
  local ped = PlayerPedId()
  local veh = GetVehiclePedIsIn(ped, false)
  RollDownWindow(veh, 0)
  RollDownWindow(veh,1)
  notify("Vous avez ~b~ouvert~w~ les fenêtres avant.")
end

if item == frontdown then
  local ped = PlayerPedId()
  local veh = GetVehiclePedIsIn(ped, false)
  RollUpWindow(veh, 0)
  RollUpWindow(veh, 1)
  notify("Vous avez ~r~fermer~w~ les fenêtres avant.")
end

if item == backdown then
  local ped = PlayerPedId()
  local veh = GetVehiclePedIsIn(ped, false)
  RollUpWindow(veh, 2)
  RollUpWindow(veh, 3)
  notify("Vous avez ~r~fermer~w~ les fenêtres arrière.")
end

if item == backtup then
  local ped = PlayerPedId()
  local veh = GetVehiclePedIsIn(ped, false)
  RollDownWindow(veh, 2)
  RollDownWindow(veh, 3)
  notify("Vous avez ~b~ouvert~w~ les fenêtres arrière.")
end
end
end

function extras(menu)
  local extras = _menuPool:AddSubMenu(menu, "Extras ", '')
  local AvailableExtras = {['VehicleExtras'] = {}}
  local Items = {['Vehicle'] = {}}
  local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
  local GotVehicleExtras = false
  for ExtraID = 0, 20 do
          if DoesExtraExist(Vehicle, ExtraID) then
                  AvailableExtras.VehicleExtras[ExtraID] = (IsVehicleExtraTurnedOn(Vehicle, ExtraID) == 1)
                  GotVehicleExtras = true
          end
  end
  if GotVehicleExtras then
    SetVehicleAutoRepairDisabled(Vehicle, true)

    for Key, Value in pairs(AvailableExtras.VehicleExtras) do
            local ExtraItem = NativeUI.CreateCheckboxItem('Extra ' .. Key, AvailableExtras.VehicleExtras[Key], '')
            extras:AddItem(ExtraItem)
            Items.Vehicle[Key] = ExtraItem
    end
    extras.OnCheckboxChange = function(Sender, Item, Checked)
            for Key, Value in pairs(Items.Vehicle) do
                    if Item == Value then
                            AvailableExtras.VehicleExtras[Key] = Checked
                            if AvailableExtras.VehicleExtras[Key] then
                                    SetVehicleExtra(Vehicle, Key, 0)
                            else
                                    SetVehicleExtra(Vehicle, Key, 1)
                            end
                 end
          end
    end
end
end

function limiter(menu)
local limitervehicle = _menuPool:AddSubMenu(menu, "Limitateur de Vitesse", '')
local thirty = NativeUI.CreateItem("30", '')
local fifty = NativeUI.CreateItem("50", '')
local eighty = NativeUI.CreateItem("80", '')
local onehundredandtwenty = NativeUI.CreateItem("120", '')
local offlimiter = NativeUI.CreateItem("Désactiver", '')

limitervehicle:AddItem(thirty)
limitervehicle:AddItem(fifty)
limitervehicle:AddItem(eighty)
limitervehicle:AddItem(onehundredandtwenty)
limitervehicle:AddItem(offlimiter)

limitervehicle.OnItemSelect = function(sender, item, index)
  
  if item == thirty then
    notify("Vous avez ~b~mis~w~ la vitesse à 30 Km/h.")
    if SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 8.1) then
  end
  end
  
  if item == fifty then
    notify("Vous avez ~b~mis~w~ la vitesse à 50 Km/h")
    if SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 13.7) then
  end
  end

  if item == eighty then
    notify("Vous avez ~b~mis~w~ la vitesse à 80 Km/h")
    if SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 22.0) then
  end
  end

  if item == onehundredandtwenty then
    notify("Vous avez ~b~mis~w~ la vitesse à 120 Km/h.")
    if SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 33.2) then
  end
  end

  if item == offlimiter then
    notify("Vous avez ~r~désactiver~w~ le limitateur de vitesse.")
    if SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 0.0) then
  end
  end
  end  
  end

  _menuPool:RefreshIndex() 
  
   Citizen.CreateThread(function()
      while true do
          Citizen.Wait(0)
          _menuPool:MouseControlsEnabled (false)
          _menuPool:ControlDisablingEnabled(false)
          _menuPool:ProcessMenus()
         if IsControlJustPressed(1, 166) then
          if IsPedInAnyVehicle(PlayerPedId(), false) then
            mainMenu:Clear()
           
engine(mainMenu)    
doors(mainMenu)
seatrs(mainMenu)
windows(mainMenu)
extras(mainMenu)
limiter(mainMenu)
              mainMenu:Visible(not mainMenu:Visible())
             
          
            else 
              notify("Vous ~r~devez~w~ être dans un véhicule.")
        end
      end
    end
end)

function notify(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(true, true)
end