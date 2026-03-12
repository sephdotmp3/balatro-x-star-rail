--[[
 * this_love_forever.lua
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
    key = "this_love_forever",
    loc_txt = {
        name = "This Love, Forever",
        text = {
            "This Joker gains {C:mult}+#2#{} Mult for every",
            "{C:tarot}Arcana{} and {C:spectral}Spectral{} Pack opened",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}",
        }
    },
    atlas = "joker_this_love_forever",
    config = {
        extra = {
            mult = 0,
            mult_gain = 3,
        }
    },
    discovered = true,
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    perishable_compat = false,
    calculate = function(self, card, context)
        if context.open_booster and not context.blueprint then
            if context.booster.group_key == "k_arcana_pack" or context.booster.group_key == "k_spectral_pack" then
                SMODS.scale_card(card, {
	                ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "mult_gain",
                })
            end
        elseif context.joker_main and context.cardarea == G.jokers then
            return {
                mult = card.ability.extra.mult,
                colour = G.C.MULT
            }
        end
    end,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult_gain
            }
        }
    end
}