--[[
 * memorys_curtain_never_falls.lua
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
    key = "memorys_curtain_never_falls",
    atlas = "joker_memorys_curtain_never_falls",
    discovered = true,
    rarity = 4,
    cost = 20,
    eternal_compat = false,
    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({
                        set = "Joker",
                        key = "j_bxsr_day_one_of_my_new_life",
                        no_edition = true,
                        edition = 'e_negative'
                    })
                    SMODS.add_card({
                        set = "Joker",
                        key = "j_bxsr_poised_to_bloom",
                        no_edition = true,
                        edition = 'e_negative'
                    })
                    SMODS.add_card({
                        set = "Joker",
                        key = "j_bxsr_to_evernights_stars",
                        no_edition = true,
                        edition = 'e_negative'
                    })
                    return true
                end
            }))
        end
    end
}