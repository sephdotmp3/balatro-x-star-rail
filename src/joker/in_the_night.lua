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
    loc_txt = {
        name = "In The Night",
        text = {
            "{C:green}2 in 3{} chance for {X:mult,C:white}X#3#{} Mult,",
            "{C:mult}+#4#{} Mult otherwise"
        }
    },
    atlas = "joker_in_the_night",
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = {
            base_odds_numerator = 2,
            base_odds_denominator = 3,
            xmult = 2.5,
            mult = 4,
        }
    },
    discovered = true,
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    -- TODO: write the actual calculate function
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.base_odds_numerator,
                card.ability.extra.base_odds_denominator,
                card.ability.extra.xmult,
                card.ability.extra.mult,
            }
        }
    end
}