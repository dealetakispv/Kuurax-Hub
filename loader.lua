repeat task.wait() until game:IsLoaded()

if getgenv().__KuuraxLoading and (os.clock() - (getgenv().__KuuraxLoadingTime or 0)) < 6 then
    return
end
getgenv().__KuuraxLoading = true
getgenv().__KuuraxLoadingTime = os.clock()

local games = {
    [10768372920] = "+1 Upgrade Per Kill",
    [10526463655] = "8 Ball Duels",
    [7326934954]  = "99 Nights in the Forest",
    [10708913337] = "Anime Dice",
    [2619619496]  = "BedWars",
    [7633926880]  = "Blox Strike",
    [5166944221]  = "Death Ball",
    [10526853622] = "Deep Fishing",
    [10771421858] = "Don't Splash, It Knows",
    [9051406594]  = "Dueling Grounds",
    [10769384180] = "Fake An Egg",
    [6701277882]  = "Fish It!",
    [6331902150]  = "Forsaken",
    [2668101271]  = "FTAP Hub",
    [10648640958] = "Hood Rivals",
    [10764627709] = "Huss Valley",
    [5995470825]  = "Hypershot",
    [10684750879] = "Loot To Forge",
    [9294074907]  = "One Tap",
    [5595353122]  = "Ouwland",
    [6035872082]  = "RIVALS",
    [10768845402] = "RoChess",
    [10566677406] = "Shogun's Reign",
    [9534705677]  = "Sniper Arena",
    [9974314982]  = "Spin Anime Cards",
    [10765618402] = "Steel Fighters",
    [10765298801] = "Stone Skipping",
    [10629695169] = "Tap Simulator Reborn",
    [3808081382]  = "The Strongest Battlegrounds",
    [10766972131] = "Throw Food For Animals",
    [10768498581] = "Tribes 3v3",
    [4730278139]  = "Untitled Boxing Game",
    [6739698191]  = "Violence District"
}

local current = games[game.GameId]
if not current then
    getgenv().__KuuraxLoading = nil
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Kuurax Hub",
            Text = "Game not supported yet.",
            Duration = 5
        })
    end)
    return
end

pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Kuurax Hub",
        Text = "Detected " .. current .. ". Loading suite...",
        Duration = 3
    })
end)

local url = "https://scripts.majra.live/kuurax.lua"
local ok, src = pcall(function()
    return game:HttpGet(url .. "?_t=" .. os.time())
end)

if not ok or not src or #src == 0 or src:sub(1, 1) == "<" then
    ok, src = pcall(function()
        return game:HttpGet(url)
    end)
end

getgenv().__KuuraxLoading = nil

if ok and src and #src > 0 and src:sub(1, 1) ~= "<" then
    local fn, err = loadstring(src)
    if fn then
        task.spawn(fn)
    else
        warn("Failed to compile loader:", err)
    end
else
    warn("Failed to load Kuurax Hub")
end
