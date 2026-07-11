extends CanvasLayer

@onready var background: ColorRect = $Background
@onready var dialogue_box: ColorRect = $DialogueBox
@onready var dialogue_text: Label = $DialogueBox/Label

var current_slides: Array = []
var current_texts: Array = []
var current_index:  int = 0
var is_active: bool = false

func _ready() -> void:
	visible = false
	
func start_cutscenes(slides: Array, texts: Array) -> void:
	current_slides = slides
	current_texts = texts
	current_index = 0
	is_active = true
	visible = true
	
	get_tree().paused = true
	display_current_step()
	
func _input(event: InputEvent) -> void:
	if not is_active:
		return
		
	if event.is_action_pressed("interact"):
		advance_cutscene()
		
func display_current_step() -> void:
	if current_index < current_slides.size():
		background.color = current_slides[current_index]
	
	if current_index < current_texts.size():
		dialogue_text.text = current_texts[current_index]
		
func advance_cutscene() -> void:
	current_index += 1
	
	if current_index >= current_texts.size() or current_index >= current_slides.size():
		end_cutscene()
	else:
		display_current_step()
		
func end_cutscene() -> void:
	is_active = false
	visible = false
	get_tree().paused = false
	
	
	
