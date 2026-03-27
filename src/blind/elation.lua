--[[
 * elation.lua
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
    key = "elation",
    atlas = "blind_elation",
    discovered = true,
    boss = {
        min = 2,
    },
    boss_colour = HEX("e177bb"),
    set_blind = function(self)
        local max_hands = math.floor(G.GAME.round_resets.hands*1.5)
        local max_discards = math.floor(G.GAME.current_round.discards_left*1.5)

        local hands_random = pseudorandom("sampo_the_fool")
        local discards_random = pseudorandom("giovanni_the_fool")

        local new_hands = math.ceil(max_hands*hands_random)
        local new_discards = math.floor((max_discards+1)*discards_random)

        local hands_change = new_hands - G.GAME.round_resets.hands
        if hands_change < 0 then
            self.hands_sub = 0 - hands_change
        else
            self.hands_sub = 0
        end
        if hands_change ~= 0 then
            ease_hands_played(hands_change)
        end

        local discards_change = new_discards - G.GAME.current_round.discards_left
        if discards_change < 0 then
            self.discards_sub = 0 - discards_change
        else
            self.discards_sub = 0
        end

        if discards_change ~= 0 then
            ease_discard(discards_change)
        end

        local reward_random = pseudorandom("sparkle_the_fool")

        -- taken from polterworx
		G.GAME.blind.dollars = math.floor(11*reward_random)
        --- @diagnostic disable-next-line: param-type-mismatch
		G.GAME.current_round.dollars_to_be_earned = G.GAME.blind.dollars > 8 and ('$' .. G.GAME.blind.dollars) or (string.rep(localize('$'), G.GAME.blind.dollars)..'')
		G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").config.object:update_text()

        local max_size = math.min(new_hands+new_discards, 5)
        local size_random = pseudorandom("sparxie_the_fool")

        G.GAME.blind.mult = (max_size-1)*size_random+1

        G.GAME.blind.chips = G.GAME.blind.chips / 2 * G.GAME.blind.mult
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,
    disable = function (self)
        if self.hands_sub > 0 then
            ease_hands_played(self.hands_sub)
        end
        if self.discards_sub > 0 then
            ease_discard(self.discards_sub)
        end
        if G.GAME.blind.dollars < 5 then
		    G.GAME.blind.dollars = 5
            --- @diagnostic disable-next-line: param-type-mismatch
		    G.GAME.current_round.dollars_to_be_earned = G.GAME.blind.dollars > 8 and ('$' .. G.GAME.blind.dollars) or (string.rep(localize('$'), G.GAME.blind.dollars)..'')
		    G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").config.object:update_text()
        end

        G.GAME.blind.chips = math.min(G.GAME.blind.chips / G.GAME.blind.mult * 2, G.GAME.blind.chips)
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
}