--[[
 * earthly_escapade.lua
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
    key = "earthly_escapade",
    loc_txt = {
        name = "Earthly Escapade",
        text = {
            "Randomly gives {C:chips}+#1#{} Chips,",
            "{C:mult}+#2#{} Mult, {C:attention}$#3#{}, or",
            "{C:white,X:mult}X#4#{} Mult when scored"
        }
    },
    atlas = "joker_earthly_escapade",
    config = {
        extra = {
            chips = 30,
            mult = 4,
            dollars = 3,
            xmult = 2
        }
    },
    discovered = true,
    rarity = 1,
    cost = 5,
    -- TODO: write the actual calculate function
    calculate = function(self, card, context)
        
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.dollars,
                card.ability.extra.xmult,
            }
        }
    end
}