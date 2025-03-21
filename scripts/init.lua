-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Custom Items
ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/items.jsonc")

if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.jsonc")
    -- Locations
    Tracker:AddLocations("locations/tiffany.jsonc")
    Tracker:AddLocations("locations/aiko.jsonc")
    Tracker:AddLocations("locations/kyanna.jsonc")
    Tracker:AddLocations("locations/audrey.jsonc")
    Tracker:AddLocations("locations/lola.jsonc")
    Tracker:AddLocations("locations/nikki.jsonc")
    Tracker:AddLocations("locations/jessie.jsonc")
    Tracker:AddLocations("locations/beli.jsonc")
    Tracker:AddLocations("locations/kyu.jsonc")
    Tracker:AddLocations("locations/momo.jsonc")
    Tracker:AddLocations("locations/celeste.jsonc")
    Tracker:AddLocations("locations/venus.jsonc")
end

-- Layout
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/broadcast.jsonc")
Tracker:AddLayouts("layouts/girls.jsonc")
Tracker:AddLayouts("layouts/gifts.jsonc")
Tracker:AddLayouts("layouts/uniquegifts.jsonc")
Tracker:AddLayouts("layouts/misc.jsonc")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
