--[[
 * eternal_calculus.lua
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
    key = "eternal_calculus",
    loc_txt = {
        name = "Eternal Calculus",
        text = { -- TODO: add card formatting - this one REALLY needs it
            "This Joker gains X0.15 Mult",
            "for every card played",

            "Eternally suspended in the void,",
            "Streams of shimmering data flood into THEIR mind.",
            "Turning all things past and future into symbols,",
            "THEY deduce the end from the beginning.",
            "Knowledge, answers, truths...",
            "In the mist of information, a brilliant light arises,",
            "And everything becomes clear to THEM.",
        }
    },
    atlas = "joker_eternal_calculus",
    pos = {
        x = 0,
        y = 0,
    },
    discovered = true,
    rarity = 4,
    cost = 10,
    blueprint_compat = true,
    perishable_compat = false,
    -- TODO: write the actual calculate function
}