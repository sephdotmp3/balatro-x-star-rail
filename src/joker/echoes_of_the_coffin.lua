--[[
 * echoes_of_the_coffin.lua
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
    key = "echoes_of_the_coffin",
    loc_txt = {
        name = "Echoes of the Coffin",
        text = {
            "At the end of round,",
            "gives {C:attention}$#1#{} for every",
            "#2# cards remaining",
            "in the {C:attention}deck{}",
            "{C:inactive}(Currently {C:attention}$#3#{C:inactive})"

        }
    },
    atlas = "joker_echoes_of_the_coffin",
    config = {
        extra = {
            dollars = 1,
            cards = 5,
            currently_remaining_cards = 0
        }
    },
    discovered = true,
    rarity = 1,
    cost = 6,
    -- TODO: write the actual calculate function
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.cards,
                69
            }
        }
    end
}