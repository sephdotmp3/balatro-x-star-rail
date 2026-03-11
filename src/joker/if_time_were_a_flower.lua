--[[
 * if_time_where_a_flower.lua
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
    key = "if_time_were_a_flower",
    loc_txt = {
        name = "If Time Were A Flower",
        text = {
            "Retrigger each card",
            "played when playing a",
            "{C:attention}#1#{}"
        }
    },
    atlas = "joker_if_time_were_a_flower",
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = {
            targeted_hand = "Three of a Kind"
        }
    },
    discovered = true,
    rarity = 1,
    cost = 4,
    -- TODO: write the actual calculate function
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.targeted_hand
            }
        }
    end
}