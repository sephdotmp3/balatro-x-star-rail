--[[
 * day_one_of_my_new_life.lua
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
    key = "day_one_of_my_new_life",
    loc_txt = {
        name = "Day One of My New Life",
        text = {
            "Played 7s give {C:chips}+#1#{} Chips",
            "and {C:mult}+#2#{} Mult when scored"
        }
    },
    atlas = "joker_day_one_of_my_new_life",
    config = {
        extra = {
            chips = 7,
            mult = 7
        }
    },
    discovered = true,
    rarity = 1,
    cost = 4,
    -- TODO: write the actual calculate function
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult
            }
        }
    end
}