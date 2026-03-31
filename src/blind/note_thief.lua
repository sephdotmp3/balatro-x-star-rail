--[[
 * note_thief.lua
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
    key = "note_thief",
    atlas = "blind_note_thief",
    discovered = true,
    boss = {
        showdown = true
    },
    config = {
        extra = {
            blind_increase_percent = 7,
            recorded_cards = {}
        }
    },
    boss_colour = HEX("c45cd6"),
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        local prev_recorded_cards = #G.GAME.blind.effect.extra.recorded_cards

        for _, card in pairs(cards) do
            local card_suit
            -- ok i just realized this system does not respect smudged joker but yk what that could be fixed later
            -- it's already a hassle to deal with wild cards so can you blame me for this
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

            local should_insert = true
            for _, other_card in pairs(G.GAME.blind.effect.extra.recorded_cards) do
                if insert_card.suit == "any" and insert_card.rank == other_card.rank and other_card.suit ~= "any" then
                    other_card.suit = "any"
                    prev_recorded_cards = prev_recorded_cards - 1
                    should_insert = false
                    break
                elseif other_card.suit == "any" and insert_card.rank == other_card.rank then
                    should_insert = false
                    break
                elseif insert_card.suit == other_card.suit and insert_card.rank == other_card.rank then
                    should_insert = false
                    break
                end
            end

            if should_insert then
                table.insert(G.GAME.blind.effect.extra.recorded_cards, insert_card)
            end
        end

        local unique_increase = #G.GAME.blind.effect.extra.recorded_cards - prev_recorded_cards
		G.GAME.blind:wiggle()
        local multiplier = (1+G.GAME.blind.effect.extra.blind_increase_percent/100)^unique_increase
        G.GAME.blind.chips = G.GAME.blind.chips * multiplier
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

        return mult, hand_chips, false
    end,
    -- TODO: handle disabling of blind
    loc_vars = function(self)
        return {
            vars = {
                self.config.extra.blind_increase_percent
            }
        }
    end
}