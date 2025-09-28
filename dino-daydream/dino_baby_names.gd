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
	label.text = "Your Baby Dino Name Is: " + new_text
	
	Game.dino_names.append(new_text)  # store the name in the array
	print("Now saved:", Game.dino_names)

	await get_tree().create_timer(1.5).timeout
	self.hide()
		
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	$DinoListUI.show_dinos()

	for name in Game.dino_names:
		print(name)
	
