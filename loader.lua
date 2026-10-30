repeat task.wait() until game:IsLoaded()

local url = "https://scripts.majra.live/kuurax.lua"
local ok, src = pcall(function()
    return game:HttpGet(url .. "?_t=" .. os.time())
end)

if not ok or not src or #src == 0 or src:sub(1, 1) == "<" then
    ok, src = pcall(function()
        return game:HttpGet(url)
    end)
end

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
