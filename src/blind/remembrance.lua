--[[
 * remembrance.lua
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
    key = "remembrance",
    loc_txt = {
        name = "The Remembrance",
        text = {
            -- TODO: change blind text
            "Every type of card that isn't",
            "found in your first hand",
            "will be flipped for the",
            "rest of the blind"
        },
    },
    atlas = "blind_remembrance",
    discovered = true,
    boss = {
        min = 2,
    },
    config = {
        extra = {
            first_hand_cards = {}
        }
    },
    boss_colour = HEX("cf712f"),
    -- TODO: write the actual blind effects
}