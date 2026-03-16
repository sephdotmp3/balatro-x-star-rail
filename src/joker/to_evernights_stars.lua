--[[
 * to_evernights_stars.lua
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
    key = "to_evernights_stars",
    loc_txt = {
        name = "To Evernight's Stars",
        text = {
            "Played {C:attention}7s{} give",
            "{C:white,X:mult}X#1#{} Mult when scored"
        }
    },
    atlas = "joker_to_evernights_stars",
    config = {
        extra = {
            xmult = 1.7
        }
    },
    discovered = true,
    rarity = 3,
    cost = 8,
    -- TODO: write the actual calculate function
    calculate = function(self, card, context)
        
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end
}