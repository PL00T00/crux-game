extends Node3D

@export var idx : int = 1


func _on_interactablecomponent_action_triggered() -> void:
	NotesManager.look(idx)
