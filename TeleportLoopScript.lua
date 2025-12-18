-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Positions
local targetPosition = Vector3.new(-25, 205, 93)
local originalPosition = Vector3.new(2, 107, 4)

-- Control variable
local running = false
local teleportLoop

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportGUI"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = screenGui

-- Create Start Button
local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0, 180, 0, 40)
startButton.Position = UDim2.new(0, 10, 0, 10)
startButton.Text = "Start Teleport Loop"
startButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
startButton.TextColor3 = Color3.new(1,1,1)
startButton.Parent = frame

-- Create Stop Button
local stopButton = Instance.new("TextButton")
stopButton.Size = UDim2.new(0, 180, 0, 40)
stopButton.Position = UDim2.new(0, 10, 0, 50)
stopButton.Text = "Stop Teleport Loop"
stopButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
stopButton.TextColor3 = Color3.new(1,1,1)
stopButton.Parent = frame

-- Function to start the loop
local function startTeleportLoop()
    if running then return end
    running = true
    teleportLoop = spawn(function()
        while running do
            -- Teleport to target
            hrp.CFrame = CFrame.new(targetPosition)
            wait(2)  -- wait at target

            -- Teleport back to original
            hrp.CFrame = CFrame.new(originalPosition)
            wait(8)  -- wait at original position
        end
    end)
end

-- Function to stop the loop
local function stopTeleportLoop()
    running = false
end

-- Button connections
startButton.MouseButton1Click:Connect(startTeleportLoop)
stopButton.MouseButton1Click:Connect(stopTeleportLoop)
