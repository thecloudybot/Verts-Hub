local net = coroutine.create(function()
    settings.Physics.AllowSleep = false
    while game'RunService'.RenderStepped:wait() do
        for i,v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                v.MaximumSimulationRadius = 0
                sethiddenproperty(v, 'SimulationRadius', 0)
            end
        end
        game.Players.LocalPlayer.MaximumSimulationRadius = 3e9
        setsimulationradius(math.huge)
    end
end)
coroutine.resume(net)
