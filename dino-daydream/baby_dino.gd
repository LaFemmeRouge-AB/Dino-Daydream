extends AnimatedSprite2D

@onready var baby_dino: AnimatedSprite2D = $"."
@onready var player: CharacterBody2D = $"../Player"

var BabyDinoX = self.position.x
var BabyDinoY = self.position.y
@export var offsetDinoX = -15
@export var offsetDinoY = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	BabyDinoX = player.position.x + offsetDinoX
	BabyDinoY = player.position.y + offsetDinoY
	
	self.position = Vector2(BabyDinoX,BabyDinoY)
