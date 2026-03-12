--[[
 * holiday_thermae_escapade.lua
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
    key = "holiday_thermae_escapade",
    loc_txt = {
        name = "Holiday Thermae Escapade",
        text = {
            "When scored, this Joker adds the",
            "chips scored up to this point to a tally,",
            "gives {C:attention}#2#%{} of it then clears {C:attention}#3#%{}",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips){}",
        }
    },
    atlas = "joker_holiday_thermae_escapade",
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = {
            chip_tally = 0,
            chip_return_percent = 20,
            tally_clear_percent = 50
        }
    },
    discovered = true,
    rarity = 2,
    cost = 6,
    -- TODO: write the actual calculate function
    calculate = function(self, card, context)
        
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chip_tally,
                card.ability.extra.chip_return_percent,
                card.ability.extra.tally_clear_percent
            }
        }
    end
}