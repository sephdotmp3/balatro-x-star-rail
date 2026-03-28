--[[
 * calamity_worker.lua
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
    key = "calamity_worker",
    atlas = "blind_calamity_worker",
    discovered = true,
    boss = {
        showdown = true
    },
    config = {
        extra = {
            dollars_per_card = 2
        }
    },
    boss_colour = HEX("c45cd6"),
    -- TODO: implement blind
    loc_vars = function(self)
        return {
            vars = {
                self.config.extra.dollars_per_card
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                self.config.extra.dollars_per_card
            }
        }
    end
}