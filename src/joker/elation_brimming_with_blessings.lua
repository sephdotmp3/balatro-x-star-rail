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
            "{C:attention}$50{}, {C:attention}+#3#{} levels to all {C:attention}poker hands{}"
            -- TODO: add flavour text when we get it
        }
    },
    -- TODO: add atlas when we get the light cone image
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
    rarity = 4,
    cost = 20,
    -- TODO: write the actual calculate function
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