-- Banana Cat Hub | Loader
-- Dev: ViniZ_DV

local URL = "COLOQUE_AQUI_O_LINK_DA_SOURCE"

local success, err = pcall(function()
local source = game:HttpGet(URL)
assert(source and #source > 0, "Source vazia")

local execute = loadstring(source)  
assert(execute, "Erro ao compilar source")  

execute()

end)

if not success then
warn("[Banana Cat Hub] " .. tostring(err))
end