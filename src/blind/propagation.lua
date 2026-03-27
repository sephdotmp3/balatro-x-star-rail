--[[
 * propagation.lua
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
    key = "propagation",
    atlas = "blind_propagation",
    discovered = true,
    boss = {
        min = 2,
    },
    config = {
        should_add_card = false,
        cards_added = {}
    },
    boss_colour = HEX("dd5894"),
    bxsr_after_play = function(self) -- doesn't work exactly how i'd like in terms of timing but whatever
        if G.GAME.blind.disabled then
            return
        end
        for _, _ in pairs(G.play.cards) do
            if G.GAME.blind.effect.should_add_card then
                local new_card = SMODS.add_card({
                    set = "Base",
                    area = G.deck,
                    enhancement = "m_bxsr_swarm",
                })
                -- it's also worth noting that new cards added to the deck do not get shuffled in naturally
                -- and instead get added to the bottom so it's very hard to see the swarm cards
                -- added by this blind during the blind itself. TOO BAD!
                new_card:add_to_deck()
                table.insert(G.GAME.blind.effect.cards_added, new_card)
            end
            G.GAME.blind.effect.should_add_card = not G.GAME.blind.effect.should_add_card
        end
    end,
    disable = function(self)
        SMODS.destroy_cards(G.GAME.blind.effect.cards_added)
    end
}