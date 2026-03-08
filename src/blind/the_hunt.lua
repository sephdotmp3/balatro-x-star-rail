--[[
 * the_hunt.lua
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
    key = "the_hunt",
    loc_txt = {
        name = "The Hunt",
        text = {
            "A #1# is worth",
            "1.5x, but all other",
            "hands are worth 0.65x"
        },
    },
    atlas = "blind_the_hunt",
    discovered = true,
    boss = {
        min = 3,
    },
    boss_colour = HEX("6dac15"),
    loc_vars = function(self)
        return {
            vars = {
                "(random hand)" -- TODO: replace with config entry
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                "(random hand)"
            }
        }
    end,
    -- TODO: write the actual blind effects
}