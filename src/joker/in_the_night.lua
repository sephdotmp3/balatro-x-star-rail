--[[
 * in_the_night.lua
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
    key = "in_the_night",
    atlas = "joker_in_the_night",
    config = {
        extra = {
            numerator = 2,
            denominator = 3,
            xmult = 2.5,
            mult = 4,
        }
    },
    discovered = true,
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    calculate = function(self, card, context)
	    if context.joker_main then
            if SMODS.pseudorandom_probability(card, "crit_whiffer", card.ability.extra.numerator, card.ability.extra.denominator) then
		        return {
			        xmult = card.ability.extra.xmult
		        }
            else
                return {
                    mult = card.ability.extra.mult
                }
            end
	    end
    end,
    loc_vars = function(self, info_queue, card)
	    local num, denom = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator, "bxsr_in_the_night")
	    return {
            vars = {
                num,
                denom,
                card.ability.extra.xmult,
                card.ability.extra.mult,
            }
        }
    end,
}