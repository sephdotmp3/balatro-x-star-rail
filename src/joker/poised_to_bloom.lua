--[[
 * poised_to_bloom.lua
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
    key = "poised_to_bloom",
    loc_txt = {
        name = "Poised to Bloom",
        text = {
            "Retrigger all played {C:attention}7s{} twice"
        }
    },
    atlas = "joker_poised_to_bloom",
    discovered = true,
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    -- TODO: write the actual calculate function
    calculate = function(self, card, context)
        
    end,
}