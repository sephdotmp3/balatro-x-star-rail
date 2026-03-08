--[[
 * preservation.lua
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
    key = "preservation",
    loc_txt = {
        name = "The Preservation",
        text = {
            "Every $5 below $15",
            "increases blind's required",
            "score by #1#"
        },
    },
    atlas = "blind_preservation",
    discovered = true,
    boss = {
        min = 3,
    },
    boss_colour = HEX("3861c2"),
    loc_vars = function(self)
        return {
            vars = {
                "1X base score" -- TODO: replace with actual base score
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                "1X base score"
            }
        }
    end,
    -- TODO: write the actual blind effects
}