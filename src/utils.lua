--[[
 * utils.lua
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

-- taken from https://github.com/SpectralPack/Cryptid/blob/53ca0bd5acfb6a324564aafa533588691f580d0f/lib/misc.lua#L652
function Blind:bxsr_after_play()
	if not self.disabled then
		local obj = self.config.blind
		if obj.bxsr_after_play and type(obj.bxsr_after_play) == "function" then
			return obj:bxsr_after_play()
		end
	end
end

-- taken from https://github.com/SpectralPack/Cryptid/blob/53ca0bd5acfb6a324564aafa533588691f580d0f/lib/overrides.lua#L152
local gfep = G.FUNCS.evaluate_play
---@diagnostic disable-next-line: duplicate-set-field
function G.FUNCS.evaluate_play(e)
	gfep(e)
	G.GAME.blind:bxsr_after_play()
end