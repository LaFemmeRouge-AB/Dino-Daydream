extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label2.visible = false

var has_button_been_pressed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _on_button_pressed():
	$Label2.visible = true
