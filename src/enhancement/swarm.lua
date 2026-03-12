--[[
 * swarm.lua
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

SMODS.Enhancement {
    key = "swarm",
    loc_txt = {
        name = "Swarm Card",
        text = {
            "Rankless and suitless,",
            "gives {C:chips}+#1#{} chips and is",
            "destroyed after play,",
            "but adds another",
            "Swarm Card to deck",
            "when discarded"
        }
    },
    atlas = "enhancement_swarm",
    config = {
        extra = {
            chips = 10,
        },
    },
    no_collection = true,
    discovered = true,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    weight = 0,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips,
            }
        elseif context.destroy_card and context.cardarea == G.play and context.destroy_card == card then
            return {
                remove = true
            }
        elseif context.discard and context.other_card == card then
            local new_card = SMODS.add_card({
                set = "Base",
                area = G.deck,
                enhancement = "m_bxsr_swarm",
            })
            new_card:add_to_deck()
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end
}