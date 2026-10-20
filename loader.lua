repeat task.wait() until game:IsLoaded()

if getgenv().KuuraxLoading then return end
getgenv().KuuraxLoading = true

local games = {
    [6035872082]  = "rivals",
    [7633926880]  = "blox_strike",
    [9534705677]  = "sniper_arena",
    [10684750879] = "loot_to_forge",
    [7326934954]  = "ninety_nine_nights",
    [10648640958] = "hood_rivals",
    [2668101271]  = "ftap",
    [9051406594]  = "dueling_grounds",
    [10764627709] = "huss_valley",
    [9974314982]  = "spin_anime_cards",
    [10708913337] = "anime_dice",
    [5595353122]  = "ouwland"
}

local current = games[game.GameId]
if not current then
    getgenv().KuuraxLoading = nil
    pcall(function()
        local clip = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
        if clip then
            clip("https://discord.gg/9v6mZ2TVut")
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Kuurax Hub",
            Text = "Game not supported. Discord invite copied to request it!",
            Duration = 5
        })
    end)
    return
end

pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Kuurax Hub",
        Text = "Loading " .. current .. "...",
        Duration = 3
    })
end)

local ok, src = pcall(function()
    return game:HttpGet("https://scripts.majra.live/games/" .. current .. ".lua?_t=" .. os.time())
end)

getgenv().KuuraxLoading = nil

if ok and src and #src > 0 and src:sub(1, 1) ~= "<" then
    local chunk, err = loadstring(src, current)
    if chunk then
        task.spawn(chunk)
    else
        warn("[kuurax] syntax error:", err)
    end
else
    warn("[kuurax] failed to fetch game file")
end
