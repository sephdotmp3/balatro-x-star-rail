--[[
 * final_victor.lua
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
    key = "final_victor",
    loc_txt = {
        name = "Final Victor",
        text = {
            "This Joker gains {X:mult,C:white}X#2#{} Mult each time",
            "a card is scored (max #3# times),",
            "resets after scoring",
            "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
        }
    },
    atlas = "joker_final_victor",
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.2,
            max_triggers = 15,
            xmult_base = 1,
        }
    },
    discovered = true,
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    perishable_compat = false,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint and
            card.ability.extra.xmult < card.ability.extra.max_triggers*card.ability.extra.xmult_gain then
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "xmult",
	            scalar_value = "xmult_gain",
            })
        elseif context.joker_main and context.cardarea == G.jokers then
            return {
                xmult = card.ability.extra.xmult,
                colour = G.C.XMULT
            }
        elseif context.after and not context.blueprint then
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "xmult",
	            scalar_value = "xmult_base",
                operation = function (ref_table, ref_value, initial, change)
                    ref_table[ref_value] = change
                end,
                scaling_message = {
	                message = localize("k_reset"),
	                colour = G.C.RED,
                }
            })
        end
    end,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain,
                card.ability.extra.max_triggers,
            }
        }
    end
}