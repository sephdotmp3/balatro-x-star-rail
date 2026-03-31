--[[
 * relative_tracer.lua
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
    key = "relative_tracer",
    atlas = "blind_relative_tracer",
    discovered = true,
    boss = {
        showdown = true
    },
    config = {
        extra = {
            first_hand_cards = {}
        }
    },
    boss_colour = HEX("d4b744"),
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
                            goto should_not_debuff
                        end
                    end

                    card.debuffed_by_blind = true
                    card:set_debuff(true)
                    card:juice_up()

                    ::should_not_debuff::
                end


                for _, card in pairs(G.deck.cards) do
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
                            goto should_not_debuff
                        end
                    end

                    card.debuffed_by_blind = true
                    card:set_debuff(true)

                    ::should_not_debuff::
                end
                return true
            end
        }))
    end,
    debuff_hand = function (self, cards, hand, handname, check)
        if G.GAME.blind.disabled then
            return false
        end
        for _, card in ipairs(cards) do
            if card.debuff then
                return true
            end
        end
        return false
    end,
    get_loc_debuff_text = function (self)
        return "Hand cannot contain debuffed cards"
    end,
    disable = function(self)
        for i = 1, #G.hand.cards do
            G.hand.cards[i].debuffed_by_blind = false
            G.hand.cards[i].debuffed_by_blind:set_debuff()
        end

        for i = 1, #G.deck.cards do
            G.hand.cards[i].debuffed_by_blind = false
            G.hand.cards[i].debuffed_by_blind:set_debuff()
        end
    end

}