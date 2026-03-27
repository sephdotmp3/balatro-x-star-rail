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
    atlas = "blind_preservation",
    discovered = true,
    boss = {
        min = 3,
    },
    config = {
        extra = {
            -- note that dollars_threshold means that's when the blind becomes 2X base,
            -- even though this blind's minimum score caps at 1X base
            dollars_threshold = 20,
            dollars_to_base_ratio = 5,
        }
    },
    boss_colour = HEX("3861c2"),
    set_blind = function(self)
        G.GAME.blind.mult = math.max(2 + self.config.extra.dollars_threshold/self.config.extra.dollars_to_base_ratio - (G.GAME.dollars/self.config.extra.dollars_to_base_ratio), 1)

        G.GAME.blind.chips = G.GAME.blind.chips / 2 * G.GAME.blind.mult
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,
    disable = function (self)
        G.GAME.blind.chips = math.min(G.GAME.blind.chips / G.GAME.blind.mult * 2, G.GAME.blind.chips)
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,
    loc_vars = function(self)
        return {
            vars = {
                self.config.extra.dollars_threshold,
                self.config.extra.dollars_to_base_ratio,
                get_blind_amount(G.GAME.round_resets.ante)
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                self.config.extra.dollars_threshold,
                self.config.extra.dollars_to_base_ratio,
                "1X base score"
            }
        }
    end,
}