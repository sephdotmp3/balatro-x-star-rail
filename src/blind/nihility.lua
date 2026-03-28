--[[
 * nihility.lua
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
    key = "nihility",
    atlas = "blind_nihility",
    discovered = true,
    boss = {
        min = 4,
    },
    config = {
        extra = {
            debuffed_joker = nil
        }
    },
    boss_colour = HEX("2abece"),
    calculate = function(self, blind, context)
        if context.after and not blind.disabled then
            G.E_MANAGER:add_event(Event({
                func = function ()
                    if blind.effect.extra.debuffed_joker ~= nil then
                        blind.effect.extra.debuffed_joker.debuffed_by_blind = false
                        blind.effect.extra.debuffed_joker:set_debuff(false)
                        blind.effect.extra.debuffed_joker:juice_up()
                    end
                    blind.effect.extra.debuffed_joker = nil
                    if context.scoring_name == G.GAME.current_round.most_played_poker_hand and not context.end_of_round then
                        blind.effect.extra.debuffed_joker = pseudorandom_element(G.jokers.cards,"ix_the_nihility")
                        blind.effect.extra.debuffed_joker.debuffed_by_blind = true
                        blind.effect.extra.debuffed_joker:set_debuff(true)
                        blind.effect.extra.debuffed_joker:juice_up()
                        blind:wiggle()
                    end
                    return true
                end
            }))
        end
    end,
    disable = function(self)
        G.GAME.blind.effect.extra.debuffed_joker.debuffed_by_blind = false
        G.GAME.blind.effect.extra.debuffed_joker:set_debuff(false)
        G.GAME.blind.effect.extra.debuffed_joker:juice_up()
    end,
    loc_vars = function(self)
        return {
            vars = {
                localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                localize('ph_most_played')
            }
        }
    end,
}
