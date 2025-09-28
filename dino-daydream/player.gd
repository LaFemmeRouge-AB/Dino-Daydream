extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var spring = -400
@onready var Sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction == -1:
		
		Sprite.flip_h = true
	if direction == 1:
		
		Sprite.flip_h = false
	if direction == 0:
		Sprite.pause()
	move_and_slide()


func _on_spring_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player":
		velocity.y = spring
