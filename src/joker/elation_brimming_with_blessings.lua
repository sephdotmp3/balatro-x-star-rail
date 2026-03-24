--[[
 * elation_brimming_with_blessings.lua
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
    key = "elation_brimming_with_blessings",
    loc_txt = {
        name = "Elation Brimming With Blessings",
        text = {
            "When {C:attention}Boss Blind{} is defeated,",
            "randomly gain one of the following:",
            "{C:dark_edition}+1{} {C:attention}Joker{} Slot, {C:blue}+#4#{} Hands, {C:red}+#5#{} Discards,",
            "2 random {C:dark_edition}Negative{} {C:rare}Rare{} {C:attention}Jokers{},",
            "{C:attention}$50{}, {C:attention}+#3#{} levels to all {C:attention}poker hands{}",
            "{s:0.8,C:inactive}Beneath the fingertips of geniuses, data flows steadily, endlessly.",
            "{s:0.8,C:inactive}Masks lurk in the cracks between \"occurrences,\" observing every possibility waiting to unfold.",
            "{s:0.8,C:inactive}Analysis, extrapolation, answers, questions. Isn't this a perfect stage for geniuses?",
            "{s:0.8,C:inactive}Cheers, tears, roars, wails... the emotions of life bloom in full.",
            "{s:0.8,C:inactive}The silent play grows raucous, and blessings fill elation past the brim. Is this the most captivating act?",
            "{s:0.8,C:inactive}The answer remains the same: utterly unpredictable!"
        }
    },
    atlas = "joker_elation_brimming_with_blessings",
    config = {
        extra = {
            dollars = 50,
            rare_joker_count = 2,
            poker_hand_levels = 3,
            hands = 2,
            discards = 2
        }
    },
    discovered = true,
    blueprint_compat = false,
    rarity = 4,
    cost = 20,
    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and not context.blueprint and context.main_eval and not context.repetition then
            local selection = pseudorandom("aha_the_elation")
            if selection <= 0.1667 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.jokers then
                            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                        end
                        return true
                    end
                }))
                return {
                    message = "+1 Joker Slot",
                    colour = G.C.DARK_EDITION
                }
            elseif selection <= 0.3333 then
                return {
                    dollars = card.ability.extra.dollars
                }
            elseif selection <= 0.5 then
                for _ = 1, card.ability.extra.rare_joker_count do
                    SMODS.add_card({
                        set = "Joker",
                        rarity = "Rare",
                        no_edition = true,
                        edition = 'e_negative'
                    })
                end
                return {
                    message = "+"..tostring(card.ability.extra.rare_joker_count).." Jokers",
                    colour = G.C.RARITY[3]
                }
            elseif selection <= 0.6667 then
                SMODS.upgrade_poker_hands({
                    level_up = card.ability.extra.poker_hand_levels,
                    from = card
                })
                return
            elseif selection <= 0.8333 then
                ease_hands_played(card.ability.extra.hands)
                return {
                    message = "+"..tostring(card.ability.extra.hands).." Hands",
                    colour = G.C.BLUE
                }
            else
                ease_discard(card.ability.extra.discards)
                return {
                    message = "+"..tostring(card.ability.extra.discards).." Discards",
                    colour = G.C.RED
                }
            end
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.rare_joker_count,
                card.ability.extra.poker_hand_levels,
                card.ability.extra.hands,
                card.ability.extra.discards
            }
        }
    end
}