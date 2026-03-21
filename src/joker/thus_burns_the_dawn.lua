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
    loc_txt = {
        name = "Thus Burns the Dawn",
        text = {
            "After selling {C:attention}#2#{} {C:attention}Jokers{},",
            "sell this card to gain {C:dark_edition}+1{} {C:attention}Joker{} Slot",
            "{C:inactive}({C:attention}#1#{C:inactive}/#2# cards sold)"
        }
    },
    atlas = "joker_thus_burns_the_dawn",
    config = {
        extra = {
            sold_cards = 0,
            required_sells = 12,
        }
    },
    discovered = true,
    rarity = 3,
    cost = 8,
    -- TODO: write the actual calculate function
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.sold_cards,
                card.ability.extra.required_sells
            }
        }
    end
}