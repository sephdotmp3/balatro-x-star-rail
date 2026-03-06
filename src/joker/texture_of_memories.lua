--[[
 * texture_of_memories.lua
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
    key = "texture_of_memories",
    loc_txt = {
        name = "Texture of Memories",
        text = {
            "Prevents Death once,",
            "then {C:red}self-destructs{}",
            "{s:0.8,C:inactive}The universe is like a wasteland filled with rubbish,",
            "{s:0.8,C:inactive}where occasional treasures lie undiscovered.",
            "{s:0.8,C:inactive}THEY sift through the cracks of yesterday, seeking seeds of memory.",
            "{s:0.8,C:inactive}...If a new life is to be born, its seed has to be dead.",
            "{s:0.8,C:inactive}Precious stones of pink, blue, and white are brought forth,",
            "{s:0.8,C:inactive}twinkling gently in THEIR seed plot,",
            "{s:0.8,C:inactive}even though the universe holds onto its enigmatic silence.",
        }
    },
    atlas = "joker_texture_of_memories",
    pos = {
        x = 0,
        y = 0,
    },
    discovered = true,
    rarity = 4,
    cost = 20,
    eternal_compat = false,
    calculate = function(self, card, context)
        if context.game_over and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound('tarot1')
                    card:start_dissolve()
                    return true
                end
            })) 
            return {
                message = localize('k_saved_ex'),
                saved = "Saved by the Remembrance",
                colour = G.C.RED
            }
        end
    end

}