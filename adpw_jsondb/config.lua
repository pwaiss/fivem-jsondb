Config = {}

Config.ScriptPath = GetResourcePath(GetCurrentResourceName())

function fix_url(s,C)
    for c in C:gmatch(".") do
        s=s:gsub(c.."+",c)
    end
    return s
end

Config.ScriptPath = fix_url(Config.ScriptPath,"//")


-- ezik büzük kodlar yazmayın amk
