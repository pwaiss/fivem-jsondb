# fivem-jsondb
made by: Pwais &amp; Adiss


<!-- JSON DATABASE EXAMPLE USING -->


Before Using: You must edit script path in config.lua

- Create Json File: 
    { 
    exports.adpw_jsondb:createJsonDB('NAME') 
    }


- Delete Json File:
    { exports.adpw_jsondb:deleteJsonDB('NAME') }

- Insert Data in Json File 

    { data = {
        hi = "mrb",
        hi2 = "oke"
    }

    exports.adpw_jsondb:saveJsonDB('NAME', data) }




- Edit Data in Json File 

    { exports.adpw_jsondb:editJsonDB('NAME', {
        value = {
            first = 'adiss',
            second = 'esek'
        },
        req = {
            pwais = "father"
        }
    }) }

    VALUE: data to change
    REQ: Data that should be in the found data





- Getting all ARRAY in JSON File

    { exports.adpw_jsondb:getJsonDB('NAME') }





- Find table in JSON File

    { exports.adpw_jsondb:findTableInJsonDB('NAME', {
        req = {
            realdeveloper = "adiss"
        }
    }) }

    REQ: Data that should be in the found data






- Delete table in JSON File

    { exports.adpw_jsondb:deleteTableInJsonDB('NAME', {
        req = {
            realdeveloper = "adiss"
        }
    }) }

    REQ: Data that should be in the found data 
    
    
