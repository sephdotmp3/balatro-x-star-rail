--[[
 * conflict_author.lua
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
    key = "conflict_author",
    atlas = "blind_conflict_author",
    discovered = true,
    boss = {
        showdown = true
    },
    boss_colour = HEX("d4b744"),
    bxsr_after_play = function(self)
        if not G.GAME.blind.disabled then
            local selection = pseudorandom("destruction_x_elation")
            if selection <= 0.3333 then
                SMODS.destroy_cards(G.play.cards)
            elseif selection <= 0.6667 then
                SMODS.destroy_cards(G.hand.cards)
            else
                SMODS.destroy_cards(pseudorandom_element(G.jokers.cards,"elation_x_destruction"))
            end
        end
    end
}