local Config = script:WaitForChild("Config") Config = require(Config) local air = Config.Air local blur1 = Instance.new("BlurEffect") blur1.Parent = script blur1.Size = 46 local Gui = Instance.new("NumberValue") Gui.Parent = script Gui.Name = "Gui" local Type = Instance.new("BoolValue") Type.Parent = script Type.Name = "Type" local Val = Instance.new("NumberValue") Val.Parent = script Val.Name = "Value" Val.Value = air local answer = Instance.new("NumberValue") answer.Parent = script answer.Name = "answer" local sMax = Instance.new("NumberValue") sMax.Parent = script sMax.Name = "sMax" sMax.Value = Config.TankAir local sTime = Instance.new("NumberValue") sTime.Parent = script sTime.Name = "sTime" sTime.Value = Config.TankAir local vMax = Instance.new("NumberValue") vMax.Parent = script vMax.Name = "vMax" vMax.Value = air wait() Val.Value = vMax.Value sTime.Value = sMax.Value local Character = script.Parent local Humanoid = Character:WaitForChild("Humanoid") local Lighting = game.Lighting local player = game.Players:FindFirstChild(Character.Name) while true do wait() local min = player.Character.Head.Position - (.1 * player.Character.Head.Size) local max = player.Character.Head.Position + (.1 * player.Character.Head.Size) local region = Region3.new(min,max):ExpandToGrid(4) local material = workspace.Terrain:ReadVoxels(region,4)[1][1][1] if material == Enum.Material.Water then local name = Character.Name if material == Enum.Material.Water and Humanoid.Parent:findFirstChild("Scuba") == nil and Humanoid.Parent:findFirstChild("Snorkel") == nil then end if Humanoid.Parent:findFirstChild("Scuba") == nil then if Character:FindFirstChild("Goggles") == nil then if Lighting:FindFirstChild("Blur") == nil then local blur = blur1:Clone() blur.Parent = Lighting blur.Enabled = true end end repeat wait(1) Val.Value -= 1 Gui.Value += 1 until Val.Value == 0 or Type.Value == false while Type.Value == true do wait(1) Humanoid.Health -= 5 end else if sTime.Value >= 1 then repeat wait(1) sTime.Value -= 1 until sTime.Value <= 0 or Type.Value == false while Type.Value == true do wait(1) Humanoid.Health -= 5 end else while Type.Value == true do wait(1) Humanoid.Health -= 5 end end end else if Lighting:FindFirstChild("Blur") ~= nil then Lighting.Blur:Destroy() end if Val.Value == vMax.Value then else local name = Character.Name if Val.Value <= vMax.Value then repeat wait(1) Val.Value += 1 Gui.Value -= 1 until Val.Value == vMax.Value or material == Enum.Material.Water end end if Config.Out == true then if sTime.Value == sMax.Value then else local name = Character.Name if sTime.Value <= sMax.Value then repeat wait(1) sTime.Value += 1 until sTime.Value == sMax.Value or material == Enum.Material.Water end end else game.Workspace.FillStation.ProximityPrompt.Triggered:Connect(function() sTime.Value = sMax.Value end) end end end
