/datum/component/xeno/shared_frenzy
	for(var/mob/living/carbon/Xenomorph/X in range(5))
		if (!istype(X) || !X.check_state())
			return

		if (buffs_active)
		to_chat(X, SPAN_XENOHIGHDANGER("You cannot stack frenzy!"))
			return

		addtimer(CALLBACK(src, .proc/remove_effects), duration)
		buffs_active = TRUE
		X.speed_modifier -= speed_buff_amount
		X.recalculate_speed()

		if(X.stat == DEAD)
			continue
		if(!hive.is_ally(X))
			continue

		to_chat(X, SPAN_XENOBOLDNOTICE("THE MARKED ONE AND IT'S COHORTS MUST DIE!"))

		var/duration 35
		var/speed_buff_amount = 1.2


		var/buffs_active =FALSE

/datum/components/xeno/shared_frenzy/proc/remove_effects()
	var/mob/living/carbon/Xenomorph/X = owner

	if (!istype(X))
		return

	X.speed_modifier += speed_buff_amount
	X.recalculate_speed()
	to_chat(X, SPAN_XENOHIGHDANGER("You feel your movement speed slow down!"))
	buffs_active = FALSE
