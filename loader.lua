repeat task.wait() until game:IsLoaded()

if getgenv().KuuraxLoading then return end
getgenv().KuuraxLoading = true

local games = {
    -- 1. +1 Upgrade Per Kill
    [10768372920]     = "1_upgrade_per_kill",
    [113273588963037] = "1_upgrade_per_kill",

    -- 2. 8 Ball Duels
    [10526463655]     = "8_ball_duels",
    [116921506811323] = "8_ball_duels",

    -- 3. 99 Nights in the Forest
    [7326934954]      = "ninety_nine_nights",
    [79546208627805]  = "ninety_nine_nights",
    [126509999114328] = "ninety_nine_nights",
    [126371807511901] = "ninety_nine_nights",
    [116495829265908] = "ninety_nine_nights",

    -- 4. Anime Dice
    [10708913337]     = "anime_dice",
    [113290951185459] = "anime_dice",

    -- 5. BedWars
    [2619619496]      = "bedwars",
    [6872265039]      = "bedwars",
    [6872274481]      = "bedwars",
    [8444591321]      = "bedwars",
    [8560634944]      = "bedwars",
    [8560634247]      = "bedwars",
    [8560631822]      = "bedwars",

    -- 6. Blox Strike
    [7633926880]      = "blox_strike",
    [114234929420007] = "blox_strike",
    [108194354348181] = "blox_strike",
    [135434213652028] = "blox_strike",
    [101836176558619] = "blox_strike",
    [84731941097645]  = "blox_strike",

    -- 7. Death Ball
    [5166944221]      = "death_ball",
    [109661515411512] = "death_ball",
    [83678792452277]  = "death_ball",
    [71000936793663]  = "death_ball",

    -- 8. Deep Fishing
    [10526853622]     = "deep_fishing",
    [132239307080610] = "deep_fishing",

    -- 9. Don't Splash, It Knows
    [10771421858]     = "dont_splash",
    [139386728420706] = "dont_splash",
    [119958473240233] = "dont_splash",

    -- 10. Dueling Grounds
    [9051406594]      = "dueling_grounds",
    [94217045453265]  = "dueling_grounds",
    [100484168444874] = "dueling_grounds",

    -- 11. Fake An Egg
    [10769384180]     = "fake_an_egg",
    [97289366402005]  = "fake_an_egg",

    -- 12. Fish It!
    [6701277882]      = "fish_it",
    [121864768012064] = "fish_it",

    -- 13. Forsaken
    [6331902150]      = "forsaken",
    [83645629621104]  = "forsaken",
    [18687417158]     = "forsaken",

    -- 14. FTAP Hub (Fling Things & People)
    [2668101271]      = "ftap",
    [6961824067]      = "ftap",

    -- 15. Hood Rivals
    [10648640958]     = "hood_rivals",
    [77463332823746]  = "hood_rivals",
    [113272123504853] = "hood_rivals",

    -- 16. Huss Valley
    [10764627709]     = "huss_valley",
    [107535308163741] = "huss_valley",
    [126884695624040] = "huss_valley",

    -- 17. Hypershot
    [5995470825]      = "hypershot",
    [100040622766961] = "hypershot",
    [17516596118]     = "hypershot",
    [86696142930150]  = "hypershot",
    [92980558919575]  = "hypershot",
    [97804379417079]  = "hypershot",
    [105357751512007] = "hypershot",
    [108428559529058] = "hypershot",
    [110169684430399] = "hypershot",
    [122181485177067] = "hypershot",
    [128220027114734] = "hypershot",

    -- 18. Loot To Forge
    [10684750879]     = "loot_to_forge",
    [118805555015549] = "loot_to_forge",

    -- 19. One Tap
    [9294074907]      = "one_tap",
    [90568084448279]  = "one_tap",

    -- 20. Ouwland
    [5595353122]      = "ouwland",
    [136406881576517] = "ouwland",
    [123610495988185] = "ouwland",
    [93313936655516]  = "ouwland",

    -- 21. RIVALS
    [6035872082]      = "rivals",
    [17625359962]     = "rivals",
    [117398147513099] = "rivals",
    [129604661913557] = "rivals",

    -- 22. RoChess
    [10768845402]     = "rochess",
    [139717576471404] = "rochess",
    [6222531507]      = "rochess",

    -- 23. Shogun's Reign
    [106568491289620] = "shogun_s_reign",

    -- 24. Sniper Arena
    [9534705677]      = "sniper_arena",
    [114302148100793] = "sniper_arena",

    -- 25. Spin Anime Cards
    [9974314982]      = "spin_anime_cards",
    [138198687585636] = "spin_anime_cards",

    -- 26. Steel Fighters
    [10765618402]     = "steel_fighters",
    [74122653145285]  = "steel_fighters",

    -- 27. Stone Skipping
    [10765298801]     = "stone_skipping",
    [111543903102439] = "stone_skipping",

    -- 28. Tap Simulator Reborn
    [10629695169]     = "tap_simulator_reborn",
    [72858262610964]  = "tap_simulator_reborn",

    -- 29. The Strongest Battlegrounds
    [3808081382]      = "the_strongest_battlegrounds",
    [10449761463]     = "the_strongest_battlegrounds",

    -- 30. Tribes 3v3
    [10768498581]     = "tribes_3v3",
    [72169370437173]  = "tribes_3v3",

    -- 31. Untitled Boxing Game
    [4730278139]      = "untitled_boxing_game",
    [13621938427]     = "untitled_boxing_game",

    -- 32. Violence District
    [6739698191]      = "violence_district",
    [93978595733734]  = "violence_district"
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
