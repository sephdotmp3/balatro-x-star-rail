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
    atlas = "blind_the_hunt",
    discovered = true,
    boss = {
        min = 4,
    },
    config = {
        extra = {
            targeted_hand_multiplier = 0.4,
            other_hands_multiplier = 1.5,
        }
    },
    boss_colour = HEX("6dac15"),
    calculate = function (self, blind, context)
        if context.final_scoring_step then
            if context.scoring_name == G.GAME.current_round.most_played_poker_hand and not G.GAME.blind.disabled then
                return {
                    xmult = self.config.extra.targeted_hand_multiplier,
                    remove_default_message = true,
                    colour = G.C.MULT,
                    message = tostring(self.config.extra.targeted_hand_multiplier).."x "..localize('k_mult'),
                    sound = "bxsr_the_hunt_targeted"
                }
            elseif context.scoring_name ~= G.GAME.current_round.most_played_poker_hand then
                return {
                    xmult = self.config.extra.other_hands_multiplier
                }
            end
        end
    end,
    loc_vars = function(self)
        return {
            vars = {
                G.GAME.current_round.most_played_poker_hand,
                self.config.extra.targeted_hand_multiplier,
                self.config.extra.other_hands_multiplier
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                localize("ph_most_played"),
                self.config.extra.targeted_hand_multiplier,
                self.config.extra.other_hands_multiplier
            }
        }
    end,
}