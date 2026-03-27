--[[
 * along_the_passing_shore.lua
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
    key = "along_the_passing_shore",
    atlas = "joker_along_the_passing_shore",
    config = {
        extra = {
            mult = 0,
            mult_gain = 2,
            mult_multiplier = 1.5,
        }
    },
    discovered = true,
    rarity = 3,
    cost = 7,
    blueprint_compat = true,
    perishable_compat = false,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local debuffed_tally = 0
            for _, v in pairs(context.full_hand) do
                if v.debuff then
                    debuffed_tally = debuffed_tally + 1
                end
            end
            if debuffed_tally > 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "mult_gain",
                    operation = function (ref_table, ref_value, initial, change)
                        ref_table[ref_value] = math.ceil((initial + change)*(card.ability.extra.mult_multiplier^debuffed_tally))
                    end,
                    scaling_message = {
                        message = "Weep for the departed.",
                        sound = "bxsr_acheron_debuff",
                    }
                })
            else
                SMODS.scale_card(card, {
	                ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "mult_gain",
                })
            end
        elseif context.joker_main and context.cardarea == G.jokers then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult_gain,
                card.ability.extra.mult_multiplier
            }
        }
    end
}