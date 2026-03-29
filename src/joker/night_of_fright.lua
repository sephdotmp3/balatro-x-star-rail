--[[
 * night_of_fright.lua
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
    key = "night_of_fright",
    atlas = "joker_night_of_fright",
    discovered = true,
    rarity = 1,
    cost = 5,
    calculate = function (self, card, context)
        -- world record for the longest if statement!!
        if (context.hand_drawn or context.after) and G.GAME.current_round.hands_left == 1 and G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) and not context.blueprint then
            G.GAME.blind:disable()
            return {
                message = localize('ph_boss_disabled')
            }
        end
    end
}