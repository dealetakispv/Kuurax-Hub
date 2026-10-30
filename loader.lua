repeat task.wait() until game:IsLoaded()

if getgenv().KuuraxLoading then return end
getgenv().KuuraxLoading = true

local games = {
    [10768372920] = "1_upgrade_per_kill",
    [10526463655] = "8_ball_duels",
    [7326934954]  = "ninety_nine_nights",
    [10708913337] = "anime_dice",
    [2619619496]  = "bedwars",
    [7633926880]  = "blox_strike",
    [5166944221]  = "death_ball",
    [10526853622] = "deep_fishing",
    [10771421858] = "dont_splash",
    [9051406594]  = "dueling_grounds",
    [10769384180] = "fake_an_egg",
    [6701277882]  = "fish_it",
    [6331902150]  = "forsaken",
    [2668101271]  = "ftap",
    [10648640958] = "hood_rivals",
    [10764627709] = "huss_valley",
    [5995470825]  = "hypershot",
    [10684750879] = "loot_to_forge",
    [9294074907]  = "one_tap",
    [5595353122]  = "ouwland",
    [6035872082]  = "rivals",
    [10768845402] = "rochess",
    [10566677406] = "shogun_s_reign",
    [9534705677]  = "sniper_arena",
    [9974314982]  = "spin_anime_cards",
    [10765618402] = "steel_fighters",
    [10765298801] = "stone_skipping",
    [10629695169] = "tap_simulator_reborn",
    [3808081382]  = "the_strongest_battlegrounds",
    [10768498581] = "tribes_3v3",
    [4730278139]  = "untitled_boxing_game",
    [6739698191]  = "violence_district"
}

local current = games[game.GameId]
if not current then
    getgenv().KuuraxLoading = nil
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
