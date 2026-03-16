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
    loc_txt = {
        name = "Memory's Curtain Never Falls",
        text = {
            "Sell this card to create {C:dark_edition}Negative{} copies of",
            "{C:attention}Day One of My New Life{},",
            "{C:attention}Poised to Bloom{},",
            "and {C:attention}To Evernight's Stars{}",
            "{s:0.8,C:inactive}Be it bustling, desolate, fleeting, or enduring...",
            "{s:0.8,C:inactive}every planet and every instant is brimming with countless events.",
            "{s:0.8,C:inactive}That condensed history melts at a single touch,",
            "{s:0.8,C:inactive}flowing as tears from the world's gaze—",
            "{s:0.8,C:inactive}Some say: How heavy those tears must be,",
            "{s:0.8,C:inactive}the amassed years capable of fading eternity.",
            "{s:0.8,C:inactive}Some say: How wondrous the stories they tell, sorrow so clear,",
            "{s:0.8,C:inactive}joy so serene, unmarred by even a hint of falsehood.",
            "{s:0.8,C:inactive}The Cosmos flows in silent stillness,",
            "{s:0.8,C:inactive}and THEY speak not, only watching—",
            "{s:0.8,C:inactive}Watching and waiting for them to become \"memories.\""
        }
    },
    atlas = "joker_memorys_curtain_never_falls",
    discovered = true,
    rarity = 4,
    cost = 20,
    -- TODO: write the actual calculate function
    calculate = function(self, card, context)
        
    end
}