local players = game.Players
local player = game.Players.LocalPlayer
local NetworkAccess = coroutine.create(function()
    settings().Physics.AllowSleep = nil
    while game:GetService("RunService").RenderStepped:Wait() do
        for _, players in pairs(players:GetPlayers()) do
            if players ~= player then
                players.MaximumSimulationRadius = 0
                sethiddenproperty(players, "SimulationRadius", 0)
            end 
        end
        player.MaximumSimulationRadius = 3e9
        setsimulationradius(math.huge) 
    end 
end) 
coroutine.resume(NetworkAccess)