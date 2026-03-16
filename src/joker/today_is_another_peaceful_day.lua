--[[
 * today_is_another_peaceful_day.lua
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
    key = "today_is_another_peaceful_day",
    loc_txt = {
        name = "Today Is Another Peaceful Day",
        text = {
            "This Joker gains {C:chips}+#2#{} Chips",
            "for every {C:attention}#3#{} played",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips){}",
        }
    },
    atlas = "joker_today_is_another_peaceful_day",
    config = {
        extra = {
            chips = 0,
            chip_gain = 20,
            targeted_hand = "Four of a Kind",
        }
    },
    discovered = true,
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    perishable_compat = false,
    calculate = function(self, card, context)
        if context.before and not context.blueprint and context.scoring_name == card.ability.extra.targeted_hand then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                scalar_value = "chip_gain"
            })
        elseif context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chip_gain,
                card.ability.extra.targeted_hand,
            }
        }
    end
}