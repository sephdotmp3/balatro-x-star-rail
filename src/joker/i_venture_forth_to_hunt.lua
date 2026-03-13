--[[
 * i_venture_forth_to_hunt.lua
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
    key = "i_venture_forth_to_hunt",
    loc_txt = {
        name = "I Venture Forth to Hunt",
        text = {
            "Every Enhanced Joker,",
            "Enhanced card played",
            "and Enhanced card in your hand",
            "gives {C:mult}+#1#{} Mult"
        }
    },
    atlas = "joker_i_venture_forth_to_hunt",
    config = {
        extra = {
            mult_gain = 10
        }
    },
    discovered = true,
    rarity = 3,
    cost = 7,
    -- TODO: write the actual calculate function
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_gain
            }
        }
    end
}