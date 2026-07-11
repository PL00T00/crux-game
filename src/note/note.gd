extends Node3D


func _on_interactablecomponent_action_triggered() -> void:
	CutsceneUi.start_cutscenes([Color(1, 0, 1)], ["hi"])
