--[[
 * earthly_escapade.lua
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
    key = "earthly_escapade",
    loc_txt = {
        name = "Earthly Escapade",
        text = {
            "Randomly gives {C:chips}+#1#{} Chips,",
            "{C:mult}+#2#{} Mult, {C:attention}$#3#{}, or",
            "{C:white,X:mult}X#4#{} Mult when scored"
        }
    },
    atlas = "joker_earthly_escapade",
    config = {
        extra = {
            chips = 30,
            mult = 4,
            dollars = 3,
            xmult = 2
        }
    },
    discovered = true,
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            local odds = pseudorandom("earthly_escapade")
            if odds <= 0.25 then
                return {
                    chips = card.ability.extra.chips
                }
            elseif odds <= 0.5 then
                return {
                    mult = card.ability.extra.mult
                }
            elseif odds <= 0.75 then
                return {
                    dollars = card.ability.extra.dollars
                }
            else
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.dollars,
                card.ability.extra.xmult,
            }
        }
    end
}