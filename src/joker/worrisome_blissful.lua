--[[
 * worrisome_blissful.lua
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
    key = "worrisome_blissful",
    loc_txt = {
        name = "Worrisome, Blissful",
        text = { -- TODO: tweak description to use special colours and match any ability changes
            "Every 2% scored over",
            "the blind's required score",
            "gives $1 at the end of round"
        }
    },
    atlas = "joker_worrisome_blissful",
    pos = {
        x = 0,
        y = 0,
    },
    discovered = true,
    rarity = 3,
    cost = 7,
    -- TODO: write the actual calculate function
}