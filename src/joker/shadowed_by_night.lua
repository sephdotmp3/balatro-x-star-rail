--[[
 * shadowed_by_night.lua
 * This file is part of Balatro x Star Rail
 *
 * Copyright (C) 2026 sephdotwmv
 *
 * Balatro x Star Rail is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Balatro x Star Rail is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Balatro x Star Rail; if not, see <https://www.gnu.org/licenses/>.
]]

SMODS.Joker {
    key = "shadowed_by_night",
    loc_txt = {
        name = "Shadowed By Night",
        text = { -- TODO: add card formatting
            "Every card in a High Card",
            "gives X2 Mult when scored",
        }
    },
    atlas = "joker_shadowed_by_night",
    pos = {
        x = 0,
        y = 0,
    },
    discovered = true,
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
    perishable_compat = false,
    -- TODO: write the actual calculate function
}