--[[
 * this_love_forever.lua
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
    key = "this_love_forever",
    loc_txt = {
        name = "This Love, Forever",
        text = { -- add card formatting
            "This Joker gains +3 Mult",
            "for every Booster pack opened",
        }
    },
    atlas = "joker_this_love_forever",
    pos = {
        x = 0,
        y = 0,
    },
    discovered = true,
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    perishable_compat = false,
    -- TODO: write the actual calculate function
}