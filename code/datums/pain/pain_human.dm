/datum/pain/human
	max_pain 			= 200

	threshold_mild 				= 20
	threshold_discomforting 	= 30
	threshold_moderate			= 40
	threshold_distressing		= 60
	threshold_severe			= 70
	threshold_horrible			= 80

/datum/pain/human/recalculate_pain()
	. = ..()

	if(!ishuman(source_mob))
		return
	var/mob/living/carbon/human/H = source_mob

	for(var/obj/limb/O in H.limbs)
		if(O.integrity_level_effects & LIMB_INTEGRITY_EFFECT_NONE)
			apply_pain(PAIN_DELIMB)




	return TRUE