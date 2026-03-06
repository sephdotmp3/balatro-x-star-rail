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
    loc_txt = {
        name = "Eternal Calculus",
        text = {
            "This Joker gains {X:mult,C:white}X#2#{} Mult",
            "for every card played",
            "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult){}",
            "{s:0.8,C:inactive}Eternally suspended in the void,",
            "{s:0.8,C:inactive}Streams of shimmering data flood into THEIR mind.",
            "{s:0.8,C:inactive}Turning all things past and future into symbols,",
            "{s:0.8,C:inactive}THEY deduce the end from the beginning.",
            "{s:0.8,C:inactive}Knowledge, answers, truths...",
            "{s:0.8,C:inactive}In the mist of information, a brilliant light arises,",
            "{s:0.8,C:inactive}And everything becomes clear to THEM.",
        }
    },
    atlas = "joker_eternal_calculus",
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.15,
        }
    },
    discovered = true,
    rarity = 4,
    cost = 10,
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