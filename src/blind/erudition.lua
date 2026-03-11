--[[
 * erudition.lua
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

SMODS.Blind {
    key = "erudition",
    loc_txt = {
        name = "The Erudition",
        text = {
            "Must play #1#",
            "on odd hands,",
            "but cannot play #1#",
            "on even hands",
        },
    },
    atlas = "blind_erudition",
    discovered = true,
    boss = {
        min = 4,
    },
    config = {
        extra = {
            hand_count = 0,
        }
    },
    boss_colour = HEX("20b082"),
    calculate = function(self, blind, context)
        if context.after then
            G.GAME.blind.effect.extra.hand_count = G.GAME.blind.effect.extra.hand_count + 1
        end
    end,
    debuff_hand = function(self, cards, hand, handname, check)
        local is_most_played = handname == G.GAME.current_round.most_played_poker_hand
        local is_even = G.GAME.blind.effect.extra.hand_count % 2 == 0
        return not G.GAME.blind.disabled and ((not is_most_played and is_even) or (is_most_played and not is_even))
    end,
    get_loc_debuff_text = function(self)
        if G.GAME.blind.effect.extra.hand_count % 2 == 1 then
            return "Cannot play "..G.GAME.current_round.most_played_poker_hand
        else
            return "Must play "..G.GAME.current_round.most_played_poker_hand
        end
    end,
    loc_vars = function(self)
        return {
            vars = {
                G.GAME.current_round.most_played_poker_hand,
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                localize("ph_most_played"),
            }
        }
    end,
}