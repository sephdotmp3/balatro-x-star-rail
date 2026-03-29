--[[
 * yet_hope_is_priceless.lua
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
    key = "yet_hope_is_priceless",
    atlas = "joker_yet_hope_is_priceless",
    config = {
        extra = {
            starting_size = 3,
            size_per_action = 1,
            delta_size = 0,
            base_size = 0
        }
    },
    discovered = true,
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "delta_size",
                scalar_value = "starting_size",
                scaling_message = {
                    message = "-"..tostring(card.ability.extra.starting_size).." Hand Size",
                },
                operation = function(ref_table, ref_value, initial, change)
                    ref_table[ref_value] = initial - change
                    G.hand:change_size(-change)
                end
            })
        elseif (context.press_play or context.pre_discard) and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "delta_size",
                scalar_value = "size_per_action",
                scaling_message = {
                    message = "+"..tostring(card.ability.extra.size_per_action).." Hand Size",
                },
                operation = function(ref_table, ref_value, initial, change)
                    ref_table[ref_value] = initial + change
                    G.hand:change_size(change)
                end
            })
        elseif context.end_of_round and context.main_eval and not context.blueprint then
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "delta_size",
	            scalar_value = "base_size",
                operation = function (ref_table, ref_value, initial, change)
                    G.hand:change_size(-initial)
                    ref_table[ref_value] = change
                end,
                scaling_message = {
	                message = localize("k_reset"),
	                colour = G.C.RED,
                }
            })
        elseif context.selling_self and not context.blueprint then
            -- failsafe - just like for time woven into gold
            G.hand:change_size(-card.ability.extra.delta_size)
            return
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.starting_size,
                card.ability.extra.size_per_action
            }
        }
    end
}