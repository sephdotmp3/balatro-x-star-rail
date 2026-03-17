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
    loc_txt = {
        name = "Worrisome, Blissful",
        text = {
            "Every {C:attention}#1#%{} scored over",
            "the blind's required score",
            "gives {C:attention}$#2#{} at the end of round,",
            "up to a max of {C:attention}$#3#{}"
        }
    },
    atlas = "joker_worrisome_blissful",
    config = {
        extra = {
            percent_per_dollar_inc = 5,
            dollars_per_percent_inc = 1,
            dollars_max = 20
        }
    },
    discovered = true,
    rarity = 3,
    cost = 8,
    calc_dollar_bonus = function (self, card)
        -- TODO: holy shit even with a cap this is really busted, change this to be logarithmic
        local overscore_percent = (G.GAME.chips/G.GAME.blind.chips) - 1
        local total_dollars = math.floor((overscore_percent/(card.ability.extra.percent_per_dollar_inc/100))*card.ability.extra.dollars_per_percent_inc)
        return math.min(card.ability.extra.dollars_max, total_dollars)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent_per_dollar_inc,
                card.ability.extra.dollars_per_percent_inc,
                card.ability.extra.dollars_max,
            }
        }
    end
}