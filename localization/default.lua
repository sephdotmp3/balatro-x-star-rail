return {
	descriptions = {
		Enhanced = {
			m_bxsr_swarm = {
				name = "Swarm Card",
				text = {
					"Rankless and suitless,",
					"gives {C:chips}+#1#{} chips and is",
					"destroyed after play,",
					"but adds another",
					"Swarm Card to deck",
					"when discarded",
				},
			},
		},
		Joker = {
			j_bxsr_i_venture_forth_to_hunt = {
				name = "I Venture Forth To Hunt",
				text = {
					"Enhanced cards give",
					"{C:chips}+#1#{} Chips when scored",
				},
			},
			j_bxsr_final_victor = {
				name = "Final Victor",
				text = {
					"This Joker gains {X:mult,C:white}X#2#{} Mult each time",
					"a card is scored (max #3# times),",
					"resets after scoring",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
				},
			},
			j_bxsr_holiday_thermae_escapade = {
				name = "Holiday Thermae Escapade",
				text = {
					"This Joker gains {C:attention}#2#%{} of each",
					"played {C:attention}poker hand's{} base Chips,",
					"but clears {C:attention}#3#%{} after scoring",
					"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips){}",
				},
			},
			j_bxsr_time_woven_into_gold = {
				name = "Time Woven Into Gold",
				text = {
					"Playing your most played",
					"{C:attention}poker hand{} grants {C:blue}+#1#{} hand,",
					"but {C:attention}-#2#{} hand size",
					"{C:inactive}(resets after round end, hand",
					"{C:inactive}size will not go below #3#)",
				},
			},
			j_bxsr_the_unreachable_side = {
				name = "The Unreachable Side",
				text = {
					"This Joker gives {X:mult,C:white}X#2#{} Mult",
					"for every hand played",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult,{}",
					"{C:inactive}resets after round end)",
				},
			},
			j_bxsr_echoes_of_the_coffin = {
				name = "Echoes of the Coffin",
				text = {
					"At the end of round,",
					"gives {C:attention}$#1#{} for every",
					"#2# cards remaining",
					"in the {C:attention}deck{}",
					"{C:inactive}(Currently {C:attention}$#3#{C:inactive})",
				},
			},
			j_bxsr_if_time_were_a_flower = {
				name = "If Time Were A Flower",
				text = {
					"Retrigger each card",
					"played when playing a",
					"{C:attention}#1#{}",
				},
			},
			j_bxsr_shadowed_by_night = {
				name = "Shadowed By Night",
				text = {
					"Every card in a {C:attention}High Card{}",
					"gives {X:mult,C:white}X#1#{} Mult when scored",
				},
			},
			j_bxsr_in_the_night = {
				name = "In The Night",
				text = {
					"{C:green}+#1# in #2#{} chance for",
					"{C:white,X:mult}X#3#{} Mult per {C:attention}Joker{} card,",
					"{C:mult}+#4#{} Mult otherwise",
					"{C:inactive}(Currently{} {C:green}#5# in #2#{} {C:inactive}chance)"
				},
			},
			j_bxsr_along_the_passing_shore = {
				name = "Along The Passing Shore",
				text = {
					"This Joker gains {C:mult}+#2#{} Mult per played hand,",
					"every debuffed card in played hand",
					"multiplies this tally by #3#x",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}",
				},
			},
			j_bxsr_but_the_battle_isnt_over = {
				name = "But the Battle Isn't Over",
				text = {
					"Retrigger all {V:1}#1#{} {C:attention}Jokers{}",
				},
			},
			j_bxsr_reforged_remembrance = {
				name = "Reforged Remembrance",
				text = {
					"Every other {C:attention}Blind{},",
					"create a {C:spectral}Spectral{} card",
					"when {C:attention}Blind{} is selected",
					"{C:inactive}(Must have room)",
					"{C:inactive}({C:attention}#1#{C:inactive}/2 {C:attention}Blinds{C:inactive}){}",
				},
			},
			j_bxsr_today_is_another_peaceful_day = {
				name = "Today Is Another Peaceful Day",
				text = {
					"This Joker gains {C:chips}+#2#{} Chips",
					"for every {C:attention}#3#{} played",
					"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips){}",
				},
			},
			j_bxsr_this_love_forever = {
				name = "This Love, Forever",
				text = {
					"This Joker gains {C:mult}+#2#{} Mult for every",
					"{C:tarot}Arcana{} and {C:spectral}Spectral{} Pack opened",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}",
				},
			},
			j_bxsr_though_worlds_apart = {
				name = "Though Worlds Apart",
				text = {
					"{C:attention}Stone Cards{} give {C:white,X:mult}X#1#{} Mult",
				},
			},
			j_bxsr_a_secret_vow = {
				name = "A Secret Vow",
				text = {
					"This Joker gives {C:mult}+#2#{} Mult",
					"for every {C:attention}#3#%{} score below",
					"the blind's required score",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}",
				},
			},
			j_bxsr_poised_to_bloom = {
				name = "Poised to Bloom",
				text = {
					"Retrigger all played {C:attention}7s{} twice",
				},
			},
			j_bxsr_night_of_fright = {
				name = "Night of Fright",
				text = {
					"Disables the current",
					"{C:attention}Boss Blind{} when",
					"there is 1 Hand remaining",
				},
			},
			j_bxsr_memorys_curtain_never_falls = {
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
					"{s:0.8,C:inactive}Watching and waiting for them to become \"memories.\"",
				},
			},
			j_bxsr_inherently_unjust_destiny = {
				name = "Inherently Unjust Destiny",
				text = {
					"Retrigger played cards",
					"with {V:1}Spade{} suit",
				},
			},
			j_bxsr_yet_hope_is_priceless = {
				name = "Yet Hope Is Priceless",
				text = {
					"Start with {C:attention}-#1#{} hand size,",
					"gain {C:attention}+#2#{} hand size for",
					"every {C:blue}play{} or {C:red}discard{}",
					"{C:inactive}(Resets after round end){}"
				},
			},
			j_bxsr_to_evernights_stars = {
				name = "To Evernight's Stars",
				text = {
					"Played {C:attention}7s{} give",
					"{C:white,X:mult}X#1#{} Mult when scored",
				},
			},
			j_bxsr_worrisome_blissful = {
				name = "Worrisome, Blissful",
				text = {
					"Gives {C:attention}${} logarithmically based on",
					"how much you scored over",
					"the {C:attention}Blind's{} required score",
					"{C:inactive}(ex: ~150% total score -> {C:attention}$6{C:inactive},",
					"{C:inactive}~200% -> {C:attention}$10{C:inactive}, ~300% -> {C:attention}$15{C:inactive})",
					"{C:inactive}(Max {C:attention}$#1#{C:inactive})",
				},
			},
			j_bxsr_eternal_calculus = {
				name = "Eternal Calculus",
				text = {
					"This Joker gains {X:mult,C:white}X#2#{} Mult",
					"for every card played",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult){}",
					"{s:0.8,C:inactive}Eternally suspended in the void,",
					"{s:0.8,C:inactive}Streams of shimmering data flood into THEIR mind.",
					"{s:0.8,C:inactive}Turning all things past and future into symbols,",
					"{s:0.8,C:inactive}THEY deduce the end from the beginning.",
					"{s:0.8,C:inactive}Knowledge, answers, truths...",
					"{s:0.8,C:inactive}In the mist of information, a brilliant light arises,",
					"{s:0.8,C:inactive}And everything becomes clear to THEM.",
				},
			},
			j_bxsr_earthly_escapade = {
				name = "Earthly Escapade",
				text = {
					"Randomly gives {C:chips}+#1#{} Chips,",
					"{C:mult}+#2#{} Mult, {C:attention}$#3#{}, or",
					"{C:white,X:mult}X#4#{} Mult when scored",
				},
			},
			j_bxsr_day_one_of_my_new_life = {
				name = "Day One of My New Life",
				text = {
					"Played {C:attention}7s{} give {C:chips}+#1#{} Chips",
					"and {C:mult}+#2#{} Mult when scored",
				},
			},
			j_bxsr_texture_of_memories = {
				name = "Texture of Memories",
				text = {
					"Prevents Death once,",
					"then {C:red}self-destructs{}",
					"{s:0.8,C:inactive}The universe is like a wasteland filled with rubbish,",
					"{s:0.8,C:inactive}where occasional treasures lie undiscovered.",
					"{s:0.8,C:inactive}THEY sift through the cracks of yesterday, seeking seeds of memory.",
					"{s:0.8,C:inactive}...If a new life is to be born, its seed has to be dead.",
					"{s:0.8,C:inactive}Precious stones of pink, blue, and white are brought forth,",
					"{s:0.8,C:inactive}twinkling gently in THEIR seed plot,",
					"{s:0.8,C:inactive}even though the universe holds onto its enigmatic silence.",
				},
			},
			j_bxsr_elation_brimming_with_blessings = {
				name = "Elation Brimming With Blessings",
				text = {
					"When {C:attention}Boss Blind{} is defeated,",
					"randomly gain one of the following:",
					"{C:dark_edition}+1{} {C:attention}Joker{} Slot, {C:blue}+#4#{} Hands, {C:red}+#5#{} Discards,",
					"2 random {C:dark_edition}Negative{} {C:rare}Rare{} {C:attention}Jokers{},",
					"{C:attention}$50{}, {C:attention}+#3#{} levels to all {C:attention}poker hands{}",
					"{s:0.8,C:inactive}Beneath the fingertips of geniuses, data flows steadily, endlessly.",
					"{s:0.8,C:inactive}Masks lurk in the cracks between \"occurrences,\" observing every possibility waiting to unfold.",
					"{s:0.8,C:inactive}Analysis, extrapolation, answers, questions. Isn't this a perfect stage for geniuses?",
					"{s:0.8,C:inactive}Cheers, tears, roars, wails... the emotions of life bloom in full.",
					"{s:0.8,C:inactive}The silent play grows raucous, and blessings fill elation past the brim. Is this the most captivating act?",
					"{s:0.8,C:inactive}The answer remains the same: utterly unpredictable!",
				},
			},
			j_bxsr_cruising_in_the_stellar_sea = {
				name = "Cruising in the Stellar Sea",
				text = {
					"Every Enhanced Joker,",
					"Enhanced card played",
					"and Enhanced card in your hand",
					"gives {C:white,X:mult}X#1#{} Mult",
					"{s:0.8,C:inactive}THEY cruise with the speed of a rainbow's chromatic flash.",
					"{s:0.8,C:inactive}A journey of hunting undying abominations,",
					"{s:0.8,C:inactive}collecting cures and miracles,",
					"{s:0.8,C:inactive}and seeking deliverance.",
					"{s:0.8,C:inactive}Akin to a vow unbroken, THEIR voyage will be,",
					"{s:0.8,C:inactive}ad infinitum.",
				},
			},
			j_bxsr_thus_burns_the_dawn = {
				name = "Thus Burns the Dawn",
				text = {
					"After selling {C:attention}#2#{} {C:attention}Jokers{},",
					"sell this card to gain {C:dark_edition}+1{} {C:attention}Joker{} Slot",
					"{C:inactive}({C:attention}#1#{C:inactive}/#2# Jokers sold)",
				},
			},
		},
		Blind = {
			bl_bxsr_preservation = {
				name = "The Preservation",
				text = {
					"Every $#2# below $#1#",
					"increases blind's required",
					"score by #3#",
				},
			},
			bl_bxsr_the_hunt = {
				name = "The Hunt",
				text = {
					"A #1# is worth",
					"#2#x, but all other",
					"hands are worth #3#x",
				},
			},
			bl_bxsr_erudition = {
				name = "The Erudition",
				text = {
					"Must play #1#",
					"on odd hands,",
					"but cannot play #1#",
					"on even hands",
				},
			},
			bl_bxsr_remembrance = {
				name = "The Remembrance",
				text = {
					"Every type of card that",
					"isn't found in your first",
					"hand will be flipped for",
					"the rest of the blind",
				},
			},
			bl_bxsr_abundance = {
				name = "The Abundance",
				text = {
					"If played hand doesn't",
					"beat blind, add #1#% of",
					"its score to the",
					"blind's required score",
				},
			},
			bl_bxsr_elation = {
				name = "The Elation",
				text = {
					"Start with a random number",
					"of hands and discards,",
					"reward and required score",
					"is randomized",
				},
			},
			bl_bxsr_destruction = {
				name = "The Destruction",
				text = {
					"Played cards are",
					"destroyed after scoring",
				},
			},
			bl_bxsr_nihility = {
				name = "The Nihility",
				text = {
					"Playing a #1#",
					"debuffs a random Joker",
					"during the next hand",
				},
			},
			bl_bxsr_propagation = {
				name = "The Propagation",
				text = {
					"Every other card played",
					"adds a Swarm Card",
					"to your deck",
				},
			},
			bl_bxsr_harmony = {
				name = "The Harmony",
				text = {
					"All played cards must have",
					"the same rank or suit",
				},
			},
			bl_bxsr_bionic_messiah = {
        		name = "Bionic Messiah",
        		text = {
            		"If a played #1#",
            		"does not beat blind,",
            		"add its score to this",
            		"blind's required score"
        		}
    		},
			bl_bxsr_calamity_worker = {
        		name = "Calamity Worker",
        		text = {
            		"For every $#1# below",
            		"the number of cards",
            		"in your deck,",
					"adds a Swarm Card",
					"to your deck"
        		}
    		},
    		bl_bxsr_conflict_author = {
        		name = "Conflict Author",
        		text = {
            		"After play, randomly",
            		"destroys played hand,",
            		"all cards in hand,",
            		"or a random Joker"
        		}
    		},
			bl_bxsr_note_thief = {
        		name = "Note Thief",
        		text = {
            		"Odd hands must contain",
            		"only one type of card,",
            		"but even hands cannot",
            		"contain duplicate cards"
        		}
			},
    		bl_bxsr_relative_tracer = {
        		name = "Relative Tracer",
        		text = {
            		"Debuffs every type of",
            		"card that isn't found",
            		"in your first hand,",
            		"cannot play hands",
            		"with debuffed cards"
        		},
    		},
		},
	},
}