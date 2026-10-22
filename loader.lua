repeat task.wait() until game:IsLoaded()

if getgenv().KuuraxLoading then return end
getgenv().KuuraxLoading = true

local games = {
    -- RIVALS
    [6035872082]      = "rivals",
    [17625359962]     = "rivals",
    [117398147513099] = "rivals",
    [129604661913557] = "rivals",

    -- Blox Strike
    [7633926880]      = "blox_strike",
    [114234929420007] = "blox_strike",
    [108194354348181] = "blox_strike",
    [135434213652028] = "blox_strike",
    [101836176558619] = "blox_strike",

    -- Sniper Arena
    [9534705677]      = "sniper_arena",
    [114302148100793] = "sniper_arena",

    -- Loot To Forge
    [10684750879]     = "loot_to_forge",
    [118805555015549] = "loot_to_forge",

    -- 99 Nights in the Forest
    [7326934954]      = "ninety_nine_nights",
    [79546208627805]  = "ninety_nine_nights",
    [126509999114328] = "ninety_nine_nights",
    [126371807511901] = "ninety_nine_nights",
    [116495829265908] = "ninety_nine_nights",

    -- Hood Rivals
    [10648640958]     = "hood_rivals",
    [77463332823746]  = "hood_rivals",
    [113272123504853] = "hood_rivals",

    -- FTAP (Fling Things & People)
    [2668101271]      = "ftap",
    [6961824067]      = "ftap",

    -- Dueling Grounds
    [9051406594]      = "dueling_grounds",
    [94217045453265]  = "dueling_grounds",
    [100484168444874] = "dueling_grounds",

    -- Huss Valley
    [10764627709]     = "huss_valley",
    [107535308163741] = "huss_valley",
    [126884695624040] = "huss_valley",

    -- Spin Anime Cards
    [9974314982]      = "spin_anime_cards",
    [138198687585636] = "spin_anime_cards",

    -- Anime Dice
    [10708913337]     = "anime_dice",
    [113290951185459] = "anime_dice",

    -- Ouwland
    [5595353122]      = "ouwland",
    [136406881576517] = "ouwland",
    [123610495988185] = "ouwland",
    [93313936655516]  = "ouwland",

    -- Violence District
    [6739698191]      = "violence_district",
    [93978595733734]  = "violence_district",

    -- Stone Skipping
    [10765298801]     = "stone_skipping",
    [111543903102439] = "stone_skipping",

    -- One Tap
    [9294074907]      = "one_tap",
    [90568084448279]  = "one_tap",

    -- Deep Fishing
    [10526853622]     = "deep_fishing",
    [132239307080610] = "deep_fishing",

    -- Forsaken
    [6331902150]      = "forsaken",
    [83645629621104]  = "forsaken",
    [18687417158]     = "forsaken",

    -- Tap Simulator Reborn
    [10629695169]     = "tap_simulator_reborn",
    [72858262610964]  = "tap_simulator_reborn"
}

local current = games[game.GameId] or games[game.PlaceId]
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
