--[[
 * thus_burns_the_dawn.lua
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
    key = "thus_burns_the_dawn",
    atlas = "joker_thus_burns_the_dawn",
    config = {
        extra = {
            sold_jokers = 0,
            required_sells = 12,
        }
    },
    discovered = true,
    rarity = 3,
    cost = 8,
    eternal_compat = false,
    calculate = function(self, card, context)
        if context.selling_card and context.card ~= card and context.card.area == G.jokers and not context.blueprint and card.ability.extra.sold_jokers < card.ability.extra.required_sells then
            card.ability.extra.sold_jokers = card.ability.extra.sold_jokers + 1
            local eval = function()
                return card.ability.extra.sold_jokers >= card.ability.extra.required_sells
            end
            juice_card_until(card, eval, true)
            return {
                message = tostring(card.ability.extra.sold_jokers).."/"..tostring(card.ability.extra.required_sells),
                colour = G.C.DARK_EDITION
            }
        elseif context.selling_self and not context.blueprint and card.ability.extra.sold_jokers >= card.ability.extra.required_sells then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.jokers then
                        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                    end
                    return true

                end
            }))
            return {
                message = "+1 Joker Slot",
                colour = G.C.DARK_EDITION
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.sold_jokers,
                card.ability.extra.required_sells
            }
        }
    end
}