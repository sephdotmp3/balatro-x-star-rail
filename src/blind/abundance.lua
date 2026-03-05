--[[
 * abundance.lua
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
    key = "abundance",
    loc_txt = {
        name = "The Abundance",
        text = {
            "If played hand doesn't",
            "beat blind, add 33% of",
            "its score to the",
            "blind's required score",
        },
    },
    atlas = "blind_abundance",
    discovered = true,
    boss = {
        min = 3,
    },
    config = {
        extra = {
            previous_score = 0
        }
    },
    boss_colour = HEX("eecd31"),
    bxsr_after_play = function(self)
        G.E_MANAGER:add_event(Event({
    		func = function() 
                print("Current score:")
				print(G.GAME.chips)
                print("Hand score (calculated):")
                local hand_score = G.GAME.chips - self.config.extra.previous_score
                print(hand_score)
                if G.GAME.chips < G.GAME.blind.chips and not G.GAME.blind.disabled then
                    print("this REALLY should be triggering")
			        G.GAME.blind:wiggle()

                    -- TODO: figure out why the hell blind score won't ease
			        G.E_MANAGER:add_event(Event({
				        trigger = 'ease',
				        blocking = false,
				        ref_table = G.GAME.blind,
				        ref_value = 'chips',
				        ease_to = 1000,
				        delay = 0.5,
				        func = (function(t)
                            print("HELLO?")
                            return math.floor(t)
                        end)
			        }))
		        end
                self.config.extra.previous_score = G.GAME.chips
        		return true 
 			end
		}))
		
    end
}