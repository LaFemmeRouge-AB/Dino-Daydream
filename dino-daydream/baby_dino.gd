extends AnimatedSprite2D

@onready var player: CharacterBody2D = $"../Player"

@export var offsetDinoY: int = 10
@export var DistanceBabyDino: int = 5

var BabyDinoScene = preload("res://baby_dino.tscn")

# Each dino has its own offset
var my_offset_x: int = 0

# This static counter is only used by the *scene* that spawns babies
static var babyDinoCount: int = 0

func _ready() -> void:
	# If this is the first dino in the scene
	if babyDinoCount == 0:
		my_offset_x = DistanceBabyDino * 1
		babyDinoCount = 1

func _on_button_pressed() -> void:
	var dino = BabyDinoScene.instantiate()
	dino.my_offset_x = DistanceBabyDino * babyDinoCount
	get_parent().add_child(dino)

	babyDinoCount += 1
	

func _process(delta: float) -> void:
	if player:
		position = player.position + Vector2(-my_offset_x, offsetDinoY)


func _on_crystal_body_entered(body: Node2D) -> void:
	var dino = BabyDinoScene.instantiate()
	dino.my_offset_x = DistanceBabyDino * babyDinoCount
	get_parent().add_child(dino)

	babyDinoCount += 1
