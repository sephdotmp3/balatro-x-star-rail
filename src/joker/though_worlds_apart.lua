--[[
 * though_worlds_apart.lua
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
    key = "though_worlds_apart",
    loc_txt = {
        name = "Though Worlds Apart",
        text = {
            "{C:attention}Stone Cards{} give {C:white,X:mult}X#1#{} Mult"
        }
    },
    atlas = "joker_though_worlds_apart",
    config = {
        extra = {
            xmult = 1.5
        }
    },
    discovered = true,
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_stone") then
            return {
                xmult = card.ability.extra.xmult,
                card = card
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end
}