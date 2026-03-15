--[[
 * reforged_remembrance.lua
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
    key = "reforged_remembrance",
    loc_txt = {
        name = "Reforged Remembrance",
        text = {
            "Every other {C:attention}Blind{},",
            "create a {C:spectral}Spectral{} card",
            "when {C:attention}Blind{} is selected",
            "{C:inactive}(Must have room)",
            "{C:inactive}({C:attention}#1#{C:inactive}/2 {C:attention}Blinds{C:inactive}){}"
        }
    },
    atlas = "joker_reforged_remembrance",
    config = {
        extra = {
            cooldown = 1
        }
    },
    discovered = true,
    rarity = 2,
    cost = 6,
    calculate = function(self, card, context)
        if context.setting_blind then
            if card.ability.extra.cooldown == 1 then
                card.ability.extra.cooldown = card.ability.extra.cooldown + 1
                return {
                    message = "Next blind!",
                    colour = G.C.SECONDARY_SET.Spectral
                }
            end

            if #G.consumeables.cards + G.GAME.consumeable_buffer >= G.consumeables.config.card_limit then
                return
            end
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({
                        set = "Spectral"
                    })
                    card.ability.extra.cooldown = card.ability.extra.cooldown - 1
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return {
                message = "+1 Spectral",
                colour = G.C.SECONDARY_SET.Spectral
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars= {
                card.ability.extra.cooldown
            }
        }
    end
}