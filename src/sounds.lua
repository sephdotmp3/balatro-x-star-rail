--[[
 * sounds.lua
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

SMODS.Sound {
    -- this SHOULD be "along_the_passing_shore_debuff_scale" or something like that,
    -- but i'm not making an insanely long key for something one-time.
    -- also i'm pretty sure something's off with the pitch but i'm not fixing that rn
    key = "acheron_debuff",
    path = "acheron_debuff.wav",
}

SMODS.Sound {
    key = "the_hunt_targeted",
    path = "the_hunt_targeted.wav",
}