--[[
 * worrisome_blissful.lua
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
    key = "worrisome_blissful",
    atlas = "joker_worrisome_blissful",
    config = {
        extra = {
            max_dollars = 25
        }
    },
    discovered = true,
    rarity = 3,
    cost = 8,
    calc_dollar_bonus = function(self, card)
        local score_percent = (G.GAME.chips/G.GAME.blind.chips)
        print(score_percent)
        -- this is a funky equation, but it'll do
        local total_dollars = 21*math.log((2.1*score_percent)+1-2.1,10)
        return math.min(math.floor(total_dollars), card.ability.extra.max_dollars)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.max_dollars
            }
        }
    end
}