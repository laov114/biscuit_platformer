extends Area2D
class_name Biscuit

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body : Node2D):
	print("Player ate a biscuit!")
	Global.add_point()
	animation_player.play("pickup")
