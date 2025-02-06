-- Script configurations
local config = {
    -- Experience level to level up
    xpLevelUp = 100,
    
    -- Time to wait between actions
    waitTime = 1,
    
    -- Character ID
    characterId = "Your character ID here",
    
    -- Island ID where the character will farm
    islandId = "Island where the character will farm",
}

-- Function to level up
local function levelUp()
    -- Check if the character has enough experience to level up
    if game.Players.LocalPlayer.Character.Humanoid.XP >= config.xpLevelUp then
        -- Level up
        game.Players.LocalPlayer.Character.Humanoid:LevelUp()
        print("Leveled up!")
    end
end

-- Function to farm experience
local function farmXP()
    -- Check if the character is on the correct island
    if game.Workspace:FindFirstChild(config.islandId) then
        -- Farm experience
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if (enemy.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                -- Attack the enemy
                enemy:Destroy()
                print("Attacked an enemy!")
            end
        end
    else
        print("The character is not on the correct island.")
    end
end

-- Main script loop
while true do
    -- Check if the character is alive
    if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
        -- Level up
        levelUp()
        
        -- Farm experience
        farmXP()
    else
        print("The character has died.")
    end
    
    -- Wait for a time before executing again
    wait(config.waitTime)
end


