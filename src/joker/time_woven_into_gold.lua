--[[
 * time_woven_into_gold.lua
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
    key = "time_woven_into_gold",
    loc_txt = {
        name = "Time Woven Into Gold",
        text = {
            "Playing your most",
            "played {C:attention}poker hand{}",
            "grants {C:blue}+#1#{} hand,",
            "but {C:attention}-#2#{} hand size",
            "(resets after round end)"
        }
    },
    atlas = "joker_time_woven_into_gold",
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = {
            hand_gain = 1,
            size_loss = 1,
            total_loss = 0,
        }
    },
    discovered = true,
    rarity = 3,
    cost = 7,
    calculate = function(self, card, context)
        local most_played_hand
        if (context.before or context.after) and not context.blueprint then
            most_played_hand = "High Card"
            for k, v in pairs(G.GAME.hands) do
                if v.played > G.GAME.hands[most_played_hand].played and SMODS.is_poker_hand_visible(k) then
                    most_played_hand = k
                end
            end
        end

        if context.before and not context.blueprint and context.scoring_name == most_played_hand then
            ease_hands_played(card.ability.extra.hand_gain)
            return {
                message = "+"..number_format(card.ability.extra.hand_gain).." Hand",
                colour = G.C.BLUE
            }
        elseif context.after and not context.blueprint and context.scoring_name == most_played_hand then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand:change_size(-card.ability.extra.size_loss)
                    card.ability.extra.total_loss = card.ability.extra.total_loss + card.ability.extra.size_loss
                    return true
                end
            }))
        elseif context.end_of_round and context.main_eval and not context.blueprint then
            G.hand:change_size(card.ability.extra.total_loss)
            card.ability.extra.total_loss = 0
            return {
                message = localize("k_reset")
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hand_gain,
                card.ability.extra.size_loss,
            }
        }
    end
}