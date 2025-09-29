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

var crystal_touched1 = 0
var crystal_touched2 = 0
func _on_crystal_body_entered(body: Node2D) -> void:
	
	
	
	if crystal_touched1 < 1:
		$"../DinoBabyNames".show()
		var dino = BabyDinoScene.instantiate()
		dino.my_offset_x = DistanceBabyDino * babyDinoCount
		get_parent().add_child(dino)
		crystal_touched1 += 1
		babyDinoCount += 1
		$"../crystal".hide()
		$"../DinoBabyNames".show()
	
		


func _on_crystal_2_body_entered(body: Node2D) -> void:
	$"../DinoBabyNames2".show()
	if crystal_touched2 < 1:
		var dino = BabyDinoScene.instantiate()
		dino.my_offset_x = DistanceBabyDino * babyDinoCount
		get_parent().add_child(dino)
		crystal_touched2 += 1
		babyDinoCount += 1
		$"../crystal2".hide()
		$"../DinoBabyNames2".show()


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
