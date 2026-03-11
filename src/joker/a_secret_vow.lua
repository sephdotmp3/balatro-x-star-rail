--[[
 * a_secret_vow.lua
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
    key = "a_secret_vow",
    loc_txt = {
        name = "A Secret Vow",
        text = {
            "This Joker gives {C:mult}+#2#{} Mult",
            "for every {C:attention}#3#%{} score below",
            "the blind's required score",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}",
        }
    },
    atlas = "joker_a_secret_vow",
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = {
            mult = nil,
            mult_gain = 1,
            percent_per_mult = 2,
        }
    },
    discovered = true,
    rarity = 3,
    cost = 6,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local percent_below = 1 - (G.GAME.chips / G.GAME.blind.chips)
            local actual_percent_per_mult = card.ability.extra.percent_per_mult / 100
            card.ability.extra.mult = math.floor(percent_below / actual_percent_per_mult)
        elseif context.joker_main and context.cardarea == G.jokers then
            return {
                mult = card.ability.extra.mult,
                colour = G.C.MULT
            }
        elseif context.after and not context.blueprint then
            card.ability.extra.mult = nil
        end
    end,
    loc_vars = function(self, info_queue, card)
        local displayed_mult
        if card.ability.extra.mult ~= nil then
            displayed_mult = card.ability.extra.mult
        elseif G.GAME.chips ~= nil and G.GAME.blind ~= nil and G.GAME.blind.chips ~= nil and G.GAME.blind.chips > 0 then
            local percent_below = 1 - (G.GAME.chips / G.GAME.blind.chips)
            local actual_percent_per_mult = card.ability.extra.percent_per_mult / 100
            displayed_mult = math.floor(percent_below / actual_percent_per_mult)
            assert(displayed_mult == displayed_mult)
        else
            displayed_mult = math.floor(card.ability.extra.mult_gain/card.ability.extra.percent_per_mult*100)
        end
        return {
            vars = {
                displayed_mult,
                card.ability.extra.mult_gain,
                card.ability.extra.percent_per_mult
            }
        }
    end
}