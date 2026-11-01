repeat task.wait() until game:IsLoaded()

if getgenv().__KuuraxLoading and (os.clock() - (getgenv().__KuuraxLoadingTime or 0)) < 6 then
    return
end
getgenv().__KuuraxLoading = true
getgenv().__KuuraxLoadingTime = os.clock()

local games = {
    -- 1. +1 Upgrade Per Kill
    [10768372920]     = "+1 Upgrade Per Kill",
    [113273588963037] = "+1 Upgrade Per Kill",

    -- 2. 8 Ball Duels
    [10526463655]     = "8 Ball Duels",
    [116921506811323] = "8 Ball Duels",

    -- 3. 99 Nights in the Forest
    [7326934954]      = "99 Nights in the Forest",
    [79546208627805]  = "99 Nights in the Forest",
    [126509999114328] = "99 Nights in the Forest",
    [126371807511901] = "99 Nights in the Forest",
    [116495829265908] = "99 Nights in the Forest",

    -- 4. Anime Dice
    [10708913337]     = "Anime Dice",
    [113290951185459] = "Anime Dice",

    -- 5. BedWars
    [2619619496]      = "BedWars",
    [6872265039]      = "BedWars",
    [6872274481]      = "BedWars",
    [8444591321]      = "BedWars",
    [8560634944]      = "BedWars",
    [8560634247]      = "BedWars",

    -- 6. Blox Strike
    [7633926880]      = "Blox Strike",
    [114234929420007] = "Blox Strike",
    [108194354348181] = "Blox Strike",
    [135434213652028] = "Blox Strike",
    [101836176558619] = "Blox Strike",

    -- 7. Death Ball
    [5166944221]      = "Death Ball",
    [109661515411512] = "Death Ball",
    [83678792452277]  = "Death Ball",
    [71000936793663]  = "Death Ball",

    -- 8. Deep Fishing
    [10526853622]     = "Deep Fishing",
    [132239307080610] = "Deep Fishing",

    -- 9. Don't Splash, It Knows
    [10771421858]     = "Don't Splash, It Knows",
    [139386728420706] = "Don't Splash, It Knows",
    [119958473240233] = "Don't Splash, It Knows",

    -- 10. Dueling Grounds
    [9051406594]      = "Dueling Grounds",
    [94217045453265]  = "Dueling Grounds",
    [100484168444874] = "Dueling Grounds",

    -- 11. Fake An Egg
    [10769384180]     = "Fake An Egg",
    [97289366402005]  = "Fake An Egg",

    -- 12. Fish It!
    [6701277882]      = "Fish It!",
    [121864768012064] = "Fish It!",

    -- 13. Forsaken
    [6331902150]      = "Forsaken",
    [83645629621104]  = "Forsaken",
    [18687417158]     = "Forsaken",

    -- 14. FTAP Hub (Fling Things & People)
    [2668101271]      = "FTAP Hub",
    [6961824067]      = "FTAP Hub",

    -- 15. Hood Rivals
    [10648640958]     = "Hood Rivals",
    [77463332823746]  = "Hood Rivals",
    [113272123504853] = "Hood Rivals",

    -- 16. Huss Valley
    [10764627709]     = "Huss Valley",
    [107535308163741] = "Huss Valley",
    [126884695624040] = "Huss Valley",

    -- 17. Hypershot
    [5995470825]      = "Hypershot",
    [100040622766961] = "Hypershot",
    [17516596118]     = "Hypershot",
    [86696142930150]  = "Hypershot",
    [92980558919575]  = "Hypershot",
    [97804379417079]  = "Hypershot",
    [105357751512007] = "Hypershot",
    [108428559529058] = "Hypershot",
    [110169684430399] = "Hypershot",
    [122181485177067] = "Hypershot",
    [128220027114734] = "Hypershot",

    -- 18. Loot To Forge
    [10684750879]     = "Loot To Forge",
    [118805555015549] = "Loot To Forge",

    -- 19. One Tap
    [9294074907]      = "One Tap",
    [90568084448279]  = "One Tap",

    -- 20. Ouwland
    [5595353122]      = "Ouwland",
    [136406881576517] = "Ouwland",
    [123610495988185] = "Ouwland",
    [93313936655516]  = "Ouwland",

    -- 21. RIVALS
    [6035872082]      = "RIVALS",
    [17625359962]     = "RIVALS",
    [117398147513099] = "RIVALS",
    [129604661913557] = "RIVALS",

    -- 22. RoChess
    [10768845402]     = "RoChess",
    [139717576471404] = "RoChess",

    -- 23. Shogun's Reign
    [10566677406]     = "Shogun's Reign",
    [106568491289620] = "Shogun's Reign",

    -- 24. Sniper Arena
    [9534705677]      = "Sniper Arena",
    [114302148100793] = "Sniper Arena",

    -- 25. Spin Anime Cards
    [9974314982]      = "Spin Anime Cards",
    [138198687585636] = "Spin Anime Cards",

    -- 26. Steel Fighters
    [10765618402]     = "Steel Fighters",
    [74122653145285]  = "Steel Fighters",

    -- 27. Stone Skipping
    [10765298801]     = "Stone Skipping",
    [111543903102439] = "Stone Skipping",

    -- 28. Tap Simulator Reborn
    [10629695169]     = "Tap Simulator Reborn",
    [72858262610964]  = "Tap Simulator Reborn",

    -- 29. The Strongest Battlegrounds
    [3808081382]      = "The Strongest Battlegrounds",
    [10449761463]     = "The Strongest Battlegrounds",

    -- 30. Throw Food For Animals
    [10766972131]     = "Throw Food For Animals",
    [120219252362013] = "Throw Food For Animals",

    -- 31. Tribes 3v3
    [10768498581]     = "Tribes 3v3",
    [72169370437173]  = "Tribes 3v3",

    -- 32. Untitled Boxing Game
    [4730278139]      = "Untitled Boxing Game",
    [13621938427]     = "Untitled Boxing Game",

    -- 33. Violence District
    [6739698191]      = "Violence District",
    [93978595733734]  = "Violence District"
}

local current = games[game.GameId] or games[game.PlaceId]
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
