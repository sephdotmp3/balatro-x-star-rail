--[[
 * but_the_battle_isnt_over.lua
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

-- i apologize in advance, this exact joker effect is already implemented in another mod.
-- https://github.com/Balatro-Paperback/paperback/blob/9c67a31a418873630f99257de082f8a3e96286a3/content/joker/the_normal_joker.lua
-- i try not to have effects that other mods implement, but this is an instance of parallel thinking.
-- i thought it would be fun to have a joker that had a similar philosophy of bronya's "another turn!" archetype, but oh well

SMODS.Joker {
    key = "but_the_battle_isnt_over",
    atlas = "joker_but_the_battle_isnt_over",
    config = {
        extra = {
            targeted_rarity = "Common"
        }
    },
    discovered = true,
    rarity = 3,
    cost = 9,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.retrigger_joker_check and context.other_card:is_rarity(card.ability.extra.targeted_rarity) then
            return {
                repetitions = 1,
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.targeted_rarity,
                colours = {
                    G.C.RARITY.Common
                }
            }
        }
    end
}