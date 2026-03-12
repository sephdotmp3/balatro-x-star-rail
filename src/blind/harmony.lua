--[[
 * harmony.lua
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
    key = "harmony",
    loc_txt = {
        name = "The Harmony",
        text = {
            "All played cards must have",
            "the same rank or suit",
        },
    },
    atlas = "blind_harmony",
    discovered = true,
    boss = {
        min = 3,
    },
    boss_colour = HEX("9e87d7"),
    debuff_hand = function(self, cards, hand, handname, check)
        local suit = nil
        local rank = nil
        local suit_violated = nil
        local rank_violated = nil
        local should_debuff = false
        for _, card in pairs(cards) do
            if not suit_violated then
                if not SMODS.has_no_suit(card) and not SMODS.has_any_suit(card) then
                    if suit == nil then
                        suit = card.base.suit
                    end
                    suit_violated = card.base.suit ~= suit
                end
            end

            if not rank_violated then
                if not SMODS.has_no_rank(card) then
                    if rank == nil then
                        rank = card:get_id()
                    end
                    rank_violated = card:get_id() ~= rank
                end
            end

            if suit_violated and rank_violated then
                should_debuff = true
                break
            end
        end
        return should_debuff and not G.GAME.blind.disabled
    end,
    get_loc_debuff_text = function(self)
        return "All played cards must have the same rank or suit"
    end
}