--[[
 * reforged_remembrance.lua
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
    key = "reforged_remembrance",
    loc_txt = {
        name = "Reforged Remembrance",
        text = { -- TODO: tweak description to use special colours and match any ability changes
            "Every other {C:attention}Blind{},",
            "create a {C:spectral}Spectral{} card",
            "when {C:attention}Blind{} is selected",
            "{C:inactive}(Must have room)",
            "{C:inactive}({C:attention}#1#{C:inactive}/2 {C:attention}Blinds{C:inactive}){}"
        }
    },
    atlas = "joker_reforged_remembrance",
    config = {
        extra = {
            cooldown = 1
        }
    },
    discovered = true,
    rarity = 2,
    cost = 6,
    -- TODO: write the actual calculate function
    loc_vars = function(self, info_queue, card)
        return {
            vars= {
                card.ability.extra.cooldown
            }
        }
    end
}