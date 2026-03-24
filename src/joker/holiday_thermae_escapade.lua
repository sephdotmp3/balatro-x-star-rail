--[[
 * holiday_thermae_escapade.lua
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
    key = "holiday_thermae_escapade",
    loc_txt = {
        name = "Holiday Thermae Escapade",
        text = {
            "This Joker gains {C:attention}#2#%{} of each",
            "played {C:attention}poker hand's{} base Chips,",
            "but clears {C:attention}#3#%{} after scoring",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips){}",
        }
    },
    atlas = "joker_holiday_thermae_escapade",
    config = {
        extra = {
            chip_tally = 0,
            chip_return_percent = 75,
            tally_clear_percent = 50
        }
    },
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chip_tally",
                scalar_table = G.GAME.hands[context.scoring_name],
                scalar_value = "chips",
                operation = function(ref_table, ref_value, initial, change)
                    ref_table[ref_value] = initial + math.floor(change*card.ability.extra.chip_return_percent/100)
                end,
                scaling_message = {
                    message = "+"..tostring(math.floor(G.GAME.hands[context.scoring_name].chips*card.ability.extra.chip_return_percent/100))
                }
            })
        elseif context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chip_tally
            }
       elseif context.after and not context.blueprint then
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "chip_tally",
	            scalar_value = "tally_clear_percent",
                operation = function (ref_table, ref_value, initial, change)
                    ref_table[ref_value] = initial - math.floor(initial*change/100)
                end,
                scaling_message = {
	                message = localize("k_reset"),
	                colour = G.C.RED,
                }
            })
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chip_tally,
                card.ability.extra.chip_return_percent,
                card.ability.extra.tally_clear_percent
            }
        }
    end
}