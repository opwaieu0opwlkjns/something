while not game:IsLoaded() do wait(2) end
wait(2)
ranged = "Equinox Cannon"
_G.slicer = true
--only put one to true to rejoin on, or else only alrasid will rejoin
_G.Alrasid = false
_G.Gilgamesh = true

 function WaitForInstance(Ancestor, ...)
  local DescendantNames = {...}
  local Descendant = Ancestor
 
  for _, DescendantName in ipairs(DescendantNames) do
      Descendant = Descendant:WaitForChild(DescendantName)
  end
 
  return Descendant
end

ChatBar = WaitForInstance(
  game.Players.LocalPlayer,
  "PlayerGui",
  "Chat",
  "Frame",
  "ChatBarParentFrame",
  "Frame",
  "BoxFrame",
  "Frame",
  "ChatBar"
)

function Chat(Message)
    local Text = ChatBar.Text
    wait()
    ChatBar:SetTextFromInput(Message)
    wait()
    game.Players:Chat(Message)
    wait()
    ChatBar:SetTextFromInput(Text)
end

function Dungeon()
    wait(.5)
    pcall(function()
        game.Players.LocalPlayer.Backpack["Mysterious Artifact"].Parent = game.Players.LocalPlayer.Character
    end)
    wait()
    pcall(function()
        game.Players.LocalPlayer.Character["Mysterious Artifact"].RemoteEvent:FireServer()
    end)
    for i = 1,100 do
        Chat("Confirm")
        wait(1)
    end
end

Chat("/skipall")

if game.PlaceId == 9034159990 or (_G.Gilgamesh and game.PlaceId == 9280551080) then
    _G.AutoClk2 = true
    _G.kaboom = 100
    while _G.AutoClk2 do
        wait()
        pcall(function()
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:FindFirstChild("Humanoid") and not game.Players:GetPlayerFromCharacter(v) then
                    pcall(function()
                        game.Players.LocalPlayer.Backpack[ranged].Parent = game.Players.LocalPlayer.Character
                        Chat("/skipall")
                    end)
                    pcall(function()
                        if _G.slicer then
                        game.Players.LocalPlayer.Backpack["Equinox Slicer"].Parent = game.Players.LocalPlayer.Character
                        Chat("/skipall")
                        end
                    end)
                    pcall(function()
                        if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                            if v.Name == "The Arbiter" and ranged=="Equinox Cannon" and not _G.Done then
                                for i = 1,60 do 
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Head.Position+Vector3.new(0,1000,0))
                                wait(.1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,1,0)
                                end
                                _G.Done = true
                            end
                            if v.Humanoid.Health > 0 and v.Name == "Alrasid, Archbishop of the Equinox" then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1598, 1250, 1558.75)
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Head.Position+Vector3.new(0,1000,0))
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,1,0)
                            for i = 1,1 do
                                wait(.1)
                                spawn(function()
                                    if string.find(ranged,"Scythe") then
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("shoot2",{CFrame.new(v.Head.Position+Vector3.new(0,1,0),v.Head.Position),game.Players.LocalPlayer.Character[ranged].Damage.Value})
                                    elseif string.find(ranged,"Blade of the Equinox") then
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("areacutter",{v.Head.Position,1000,game.Players.LocalPlayer.Character.Torso})
                                    elseif string.find(ranged,"Blade") or string.find(ranged,"Sword") then
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("rangedslash",{v.Head.CFrame,game.Players.LocalPlayer.Character[ranged].Damage.Value})
                                    elseif string.find(ranged,"Seraph Bow") then
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("shootspecial",{v.Head.Position+Vector3.new(0,3,0),v.Head.Position,0,game.Players.LocalPlayer.Character[ranged].EDamage.Value,game.Players.LocalPlayer.Character,game.Players.LocalPlayer.Character[ranged].CDamage.Value})
                                    elseif string.find(ranged,"Eldritch Slicer") then
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("desires",{Vector3.new(0,-1,0),1500,v.Head.Position+Vector3.new(0,-5,0)})
                                    elseif string.find(ranged,"Equinox Cannon") then
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("fire",{v.Head.Position+Vector3.new(0,3,0),v.Head.Position+Vector3.new(0,2,0),100})
                                    elseif string.find(ranged,"Torrent") then
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("shoot",{CFrame.new(v.Head.Position+Vector3.new(0,3,0),v.Head.Position+Vector3.new(0,2,0)),100})
                                    elseif string.find(ranged,"Equinox Crossbow") then
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("hit",{v.Humanoid,1000,false})
                                    elseif string.find(ranged,"Ocean's Authority") then
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("pillar",{v.Head.Position,game.Players.LocalPlayer.Character.Torso})
                                    elseif string.find(ranged,"Aurium Greatbow") then
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("sun",{v.Head.Position})
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("shoot",{v.Head.CFrame*CFrame.new(0,0,2),450,v.Head.Position})
                                    else
                                        game.Players.LocalPlayer.Character[ranged].RemoteFunction:InvokeServer("shoot",{v.Head.CFrame*CFrame.new(0,0,3),game.Players.LocalPlayer.Character[ranged].Damage.Value})
                                    end
                                    if _G.slicer and (v.Name == "Equinox Praetor" and v:FindFirstChildWhichIsA("ForceField")) or (v.Name == "The Controller" and v.Barrier.Part.Transparency == 0) then
                                        wait(1)
                                        local args = {
                                            [1] = "fracturedworlds",
                                            [2] = {
                                                [1] = v.Head.Position,
                                                [2] = Vector3.new(0,0,0),
                                                [3] = 12500
                                            }
                                        }
                                        
                                        game:GetService("Players").LocalPlayer.Character["Equinox Slicer"].RemoteFunction:InvokeServer(unpack(args))
                                    end
                                end)
                            end
                        elseif v.Humanoid.Health > 0 and not v:FindFirstChild("HumanoidRootPart") and v.Name == "Alrasid, Archbishop of the Equinox" then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1598, 1000, 1558.75)
                        elseif v.Humanoid.Health <= 100 and v.Name == "Alrasid, Archbishop of the Equinox" and _G.Alrasid then
                            Dungeon()
                        elseif v.Humanoid.Health <= 100 and (v.Name == "Gilgamesh, the Consumer of Reality" or v.Name == "Tsubolasta") and _G.Gilgamesh then
                            Dungeon()
                        end
                    end)
                end
            end
        end)
    end
elseif _G.Alrasid and not _G.Gilgamesh and game.PlaceId == 9280551080 then
    Dungeon()
end
