--[[
 * the_unreachable_side.lua
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
    key = "the_unreachable_side",
    loc_txt = {
        name = "The Unreachable Side",
        text = {
            "This Joker gives {X:mult,C:white}X#2#{} Mult",
            "for every hand played",
            "(resets after round end)",
            "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult){}",
        }
    },
    atlas = "joker_the_unreachable_side",
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.5
        }
    },
    discovered = true,
    rarity = 2,
    cost = 4,
    -- TODO: write the actual calculate function
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain
            }
        }
    end
}