--[[
 * calamity_worker.lua
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
    key = "calamity_worker",
    atlas = "blind_calamity_worker",
    discovered = true,
    boss = {
        showdown = true
    },
    config = {
        extra = {
            dollars_per_card = 1,
            new_cards = {}
        }
    },
    boss_colour = HEX("c45cd6"),
    set_blind = function(self)
        if G.GAME.blind.disabled then
            return
        end
        -- i am not dealing with whatever bullshit that is lua's numeric for loop
        local i = #G.deck.cards-G.GAME.dollars
        while i > 0 do
            local new_card = SMODS.add_card({
                set = "Base",
                area = G.deck,
                enhancement = "m_bxsr_swarm",
            })
            new_card:add_to_deck()
            table.insert(G.GAME.blind.effect.extra.new_cards, new_card)
            i = i - 1
        end
    end,
    disable = function(self)
        SMODS.destroy_cards(G.GAME.blind.effect.extra.new_cards, true, true, true)
    end,
    loc_vars = function(self)
        return {
            vars = {
                self.config.extra.dollars_per_card
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                self.config.extra.dollars_per_card
            }
        }
    end
}