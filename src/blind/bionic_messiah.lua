--[[
 * bionic_messiah.lua
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
    key = "bionic_messiah",
    atlas = "blind_bionic_messiah",
    discovered = true,
    boss = {
        showdown = true
    },
    config = {
        extra = {
            previous_score = 0,
            total_score_increase = 0,
        }
    },
    boss_colour = HEX("d4b744"),
    calculate = function(self, blind, context)
        if context.after and context.scoring_name == G.GAME.current_round.most_played_poker_hand then
            G.E_MANAGER:add_event(Event({
    		    func = function()
                local hand_score = G.GAME.chips - blind.effect.extra.previous_score
                    if G.GAME.chips < blind.chips and not blind.disabled then
			            blind:wiggle()
                        local current_increase = hand_score
                        blind.effect.extra.total_score_increase = blind.effect.extra.total_score_increase + current_increase
                        blind.chips = blind.chips + current_increase
                        blind.chip_text = number_format(G.GAME.blind.chips)
		            end
        		return true
 			end
		}))
        end
    end,
    disable = function(self)
        G.GAME.blind.chips = G.GAME.blind.chips - G.GAME.blind.effect.extra.total_score_increase
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,
    loc_vars = function(self)
        return {
            vars = {
                localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                localize('ph_most_played')
            }
        }
    end,
}