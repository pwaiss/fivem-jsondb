function createJsonDB(dbName)
    -- json dosyası oluştur
    local f = io.open(Config.ScriptPath .. 'SQLS/' .. dbName .. ".json", "w")
	f:write("[]")
	f:close()
end

function deleteJsonDB(dbName)
    os.remove(Config.ScriptPath .. 'SQLS/' .. dbName .. ".json")
end

function saveJsonDB(dbName, dbData)
    dbTable = {}
    local jsondb = LoadResourceFile(GetCurrentResourceName(), 'SQLS/'..dbName..'.json')
    if jsondb then
        dbTable = json.decode(jsondb)
    end

    table.insert(dbTable, dbData)
    SaveResourceFile(GetCurrentResourceName(), 'SQLS/'..dbName..'.json', json.encode(dbTable))
    dbTable = {}
end

function editJsonDB(dbName, dataValue)

    dbTable = {}
    local jsondb = LoadResourceFile(GetCurrentResourceName(), 'SQLS/'..dbName..'.json')
    if jsondb then
        dbTable = json.decode(jsondb)
    end
    for k, v in pairs(dbTable) do
        for i, j in pairs(dataValue.req) do
            if v[i] == j then
                for s, m in pairs(dataValue.value) do
                    v[s] = m
                end
            end
        end
    end
    SaveResourceFile(GetCurrentResourceName(), 'SQLS/'..dbName..'.json', json.encode(dbTable))
    dbTable = {}
end

function getJsonDB(dbName)
    dbTableR = {}
    local jsondb = LoadResourceFile(GetCurrentResourceName(), 'SQLS/'..dbName..'.json')
    if jsondb then
        dbTableR = json.decode(jsondb)
    end
    return dbTableR
end

function findTableInJsonDB(dbName, dataNames)
    dbTableR = {}
    selam = {}
    local jsondb = LoadResourceFile(GetCurrentResourceName(), 'SQLS/'..dbName..'.json')
    if jsondb then
        dbTableR = json.decode(jsondb)
    end
    for k, v in pairs(dbTableR) do
        for i, j in pairs(dataNames.req) do
            if v[i] == j then
                table.insert(selam, v)
            end
        end
    end
    if json.encode(selam) == "[]" then
        return nil
    else
        return selam
    end
end

function deleteTableInJsonDB(dbName, dataNames)
    dbTable = {}
    local jsondb = LoadResourceFile(GetCurrentResourceName(), 'SQLS/'..dbName..'.json')
    if jsondb then
        dbTable = json.decode(jsondb)
    end
    for k, v in pairs(dbTable) do
        for i, j in pairs(dataNames.req) do
            if v[i] == j then
                table.remove(dbTable, k)
            end
        end
    end
    SaveResourceFile(GetCurrentResourceName(), 'SQLS/'..dbName..'.json', json.encode(dbTable))
end

exports('createJsonDB', createJsonDB)
exports('deleteJsonDB', deleteJsonDB)
exports('saveJsonDB', saveJsonDB)
exports('editJsonDB', editJsonDB)
exports('getJsonDB', getJsonDB)
exports('findTableInJsonNDB', findTableInJSONDB)
exports('deleteTableInJsonDB', deleteTableInJsonDB)

-- for coords example: 
-- selam = findTableInJsonDB('adiss', {req = { id = "selamalikim"}})
-- print(json.encode(selam[1].coords))

