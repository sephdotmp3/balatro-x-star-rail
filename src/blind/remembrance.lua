--[[
 * remembrance.lua
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
    key = "remembrance",
    loc_txt = {
        name = "The Remembrance",
        text = {
            "Every type of card that",
            "isn't found in your first",
            "hand will be flipped for",
            "the rest of the blind"
        },
    },
    atlas = "blind_remembrance",
    discovered = true,
    boss = {
        min = 4,
    },
    config = {
        extra = {
            first_hand_cards = {}
        }
    },
    boss_colour = HEX("cf712f"),
    press_play = function(self)
        G.E_MANAGER:add_event(Event({
            blocking = false,
            func = function()
                if #G.play.cards == 0 then
                    return false
                end

                if #G.GAME.blind.effect.extra.first_hand_cards > 0 then
                    return true
                end
                for _, card in pairs(G.play.cards) do
                    local card_suit
                    if SMODS.has_no_suit(card) then
                        card_suit = "none"
                    elseif SMODS.has_any_suit(card) then
                        card_suit = "any"
                    else
                        card_suit = card.base.suit
                    end

                    local card_rank
                    if SMODS.has_no_rank(card) then
                        card_rank = "none"
                    else
                        card_rank = card:get_id()
                    end

                    local insert_card = {
                        rank = card_rank,
                        suit = card_suit
                    }
                    table.insert(G.GAME.blind.effect.extra.first_hand_cards, insert_card)
                end

                for _, card in pairs(G.hand.cards) do
                    for _, first_hand_card in pairs(G.GAME.blind.effect.extra.first_hand_cards) do
                        local suit_violated
                        if SMODS.has_any_suit(card) or first_hand_card.suit == "any" then
                            suit_violated = false
                        elseif SMODS.has_no_suit(card) and first_hand_card.suit == "none" then
                            suit_violated = false
                        else
                            suit_violated = first_hand_card.suit ~= card.base.suit
                        end

                        local rank_violated
                        if SMODS.has_no_rank(card) and first_hand_card.rank == "none" then
                            rank_violated = false
                        else
                            rank_violated = first_hand_card.rank ~= card:get_id()
                        end

                        if not (rank_violated or suit_violated) or G.GAME.blind.disabled then
                            goto should_not_flip
                        end
                    end

                    card:flip()

                    ::should_not_flip::
                end
                return true
            end
        }))
    end,
    stay_flipped = function(self, area, card)
        if #G.GAME.blind.effect.extra.first_hand_cards == 0 or area ~= G.hand then
            return false
        end

        for _, first_hand_card in pairs(G.GAME.blind.effect.extra.first_hand_cards) do
            local suit_violated
            if SMODS.has_any_suit(card) or first_hand_card.suit == "any" then
                suit_violated = false
            elseif SMODS.has_no_suit(card) and first_hand_card.suit == "none" then
                suit_violated = false
            else
                suit_violated = first_hand_card.suit ~= card.base.suit
            end

            local rank_violated
            if SMODS.has_no_rank(card) and first_hand_card.rank == "none" then
                rank_violated = false
            else
                rank_violated = first_hand_card.rank ~= card:get_id()
            end

            if not (rank_violated or suit_violated) or G.GAME.blind.disabled then
                return false
            end
        end
        return true
    end,
    disable = function(self)
        for i = 1, #G.hand.cards do
            if G.hand.cards[i].facing == 'back' then
                G.hand.cards[i]:flip()
            end
        end
    end
}