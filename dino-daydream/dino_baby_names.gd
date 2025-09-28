extends Node2D

@onready var line_edit: LineEdit = $LineEdit
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	line_edit.text_submitted.connect(on_LineEdit_text_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_LineEdit_text_entered(new_text: String) -> void:
	var entedtimes = 0
	if entedtimes < 1:
		entedtimes += 1
		label.text = "Your Baby Dino Name Is: " + new_text
		await get_tree().create_timer(1.5).timeout
		self.hide()
