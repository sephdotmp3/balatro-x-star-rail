--[[
 * eternal_calculus.lua
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
    key = "eternal_calculus",
    atlas = "joker_eternal_calculus",
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.1,
        }
    },
    discovered = true,
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    perishable_compat = false,
    calculate = function (self, card, context)
        if context.before and not context.blueprint then
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain",
                operation = function (ref_table, ref_value, initial, change)
                    ref_table[ref_value] = initial + change*#context.full_hand
                end
            })
        elseif context.joker_main and context.cardarea == G.jokers then
            return {
                xmult = card.ability.extra.xmult,
                colour = G.C.XMULT
            }
        end
    end,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain
            }
        }
    end
}