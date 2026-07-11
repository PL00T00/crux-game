extends Node

var currently_looking_idx : int = 1

var note1_looked : bool = false
var note2_looked : bool = false
var note3_looked : bool = false
var note4_looked : bool = false
var note5_looked : bool = false
var note6_looked : bool = false
var note7_looked : bool = false
var note8_looked : bool = false
var note9_looked : bool = false


func look(idx : int) -> void:
	if idx == 1:
		
		await get_tree().create_timer(0.4).timeout
		
		Global.world.cutscene_1.visible = true
		Global.world.cutscene_1.animation_player.play(&"main")
