--[[
 * propagation.lua
 * This file is part of Balatro x Star Rail
 *
 * Copyright (C) 2025 Balatro x Star Rail
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
    loc_txt = {
        name = "The Propagation",
        text = {
            -- TODO: change blind text
            "Cool multiplying blind",
            "that I need to think of",
        },
    },
    atlas = "blind_propagation",
    discovered = true,
    boss = {
        min = 3,
    },
    boss_colour = HEX("dd5894"),
    -- TODO: write the actual blind effects
}