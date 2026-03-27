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
    atlas = "blind_abundance",
    discovered = true,
    boss = {
        min = 2,
    },
    config = {
        extra = {
            regain_percent = 50,
            previous_score = 0,
            total_score_increase = 0,
        }
    },
    boss_colour = HEX("eecd31"),
    press_play = function(self)
        G.GAME.blind.effect.extra.previous_score = G.GAME.chips
    end,
    bxsr_after_play = function(self)
        G.E_MANAGER:add_event(Event({
    		func = function()
                local hand_score = G.GAME.chips - G.GAME.blind.effect.extra.previous_score
                if G.GAME.chips < G.GAME.blind.chips and not G.GAME.blind.disabled then
			        G.GAME.blind:wiggle()
                    local current_increase = hand_score * G.GAME.blind.effect.extra.regain_percent / 100
                    G.GAME.blind.effect.extra.total_score_increase = G.GAME.blind.effect.extra.total_score_increase + current_increase
                    G.GAME.blind.chips = G.GAME.blind.chips + current_increase
			        G.E_MANAGER:add_event(Event({
				        trigger = 'ease',
				        blocking = false,
				        ref_table = G.GAME.blind,
				        ref_value = 'chip_text',
				        ease_to = G.GAME.blind.chips,
				        delay = 0.5,
				        func = (function(t)
                            return math.floor(t)
                        end)
			        }))
		        end
        		return true
 			end
		}))
    end,
    disable = function(self)
        G.GAME.blind.chips = G.GAME.blind.chips - G.GAME.blind.effect.extra.total_score_increase
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,
    loc_vars = function(self)
        return {
            vars = {
                self.config.extra.regain_percent
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                self.config.extra.regain_percent
            }
        }
    end,
}