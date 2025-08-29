extends CharacterBody2D
class_name Slime

const SPEED = 50.0

var direction : float = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone: Killzone = $Killzone

func _physics_process(delta):
	# Change the direction.
	if is_on_wall():
		direction *= -1
		
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# Add the gravity and apply movement.
	if is_on_floor():
		velocity.x = direction * SPEED
	else:
		velocity.y += gravity * delta
	
	if is_in_group("die"):
		killzone.queue_free()
	
	move_and_slide()
