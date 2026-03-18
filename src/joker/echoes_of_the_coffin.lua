--[[
 * echoes_of_the_coffin.lua
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
    key = "echoes_of_the_coffin",
    loc_txt = {
        name = "Echoes of the Coffin",
        text = {
            "At the end of round,",
            "gives {C:attention}$#1#{} for every",
            "#2# cards remaining",
            "in the {C:attention}deck{}",
            "{C:inactive}(Currently {C:attention}$#3#{C:inactive})"

        }
    },
    atlas = "joker_echoes_of_the_coffin",
    config = {
        extra = {
            numerator_dollars = 1,
            denominator_cards = 5,
            currently_remaining_cards = 0,
            total_dollars = 0
        }
    },
    discovered = true,
    rarity = 1,
    cost = 6,
    calculate = function (self, card, context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.total_dollars = math.floor(#G.deck.cards*card.ability.extra.numerator_dollars/card.ability.extra.denominator_cards)
        end
    end,
    calc_dollar_bonus = function (self, card)
        return card.ability.extra.total_dollars
    end,
    loc_vars = function(self, info_queue, card)
        local number_of_cards
        if G.deck == nil then
            number_of_cards = 52
        else
            number_of_cards = #G.deck.cards
        end
        return {
            vars = {
                card.ability.extra.numerator_dollars,
                card.ability.extra.denominator_cards,
                math.floor(number_of_cards*card.ability.extra.numerator_dollars/card.ability.extra.denominator_cards)
            }
        }
    end
}