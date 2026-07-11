extends Node

func look(idx : int) -> void:
	if idx == 1:
		
		await get_tree().create_timer(0.4).timeout
		
		Global.world.cutscene_1.visible = true
		Global.world.cutscene_1.animation_player.play(&"main")
	
	elif idx == 2:
		await get_tree().create_timer(0.4).timeout
		
		Global.world.cutscene_2.visible = true
		Global.world.cutscene_2.animation_player.play(&"main")
