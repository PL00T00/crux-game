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
		Global.world.fade.play(&"in")
		
		await get_tree().create_timer(2.0).timeout
		
		get_tree().change_scene_to_file("res://src/cutscenes/cutscene 1/cutscene_1.tscn")
