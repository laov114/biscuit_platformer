extends Area2D
class_name Killzone

@onready var timer = $Timer
@onready var game_manager : GameManager = get_node("/root/Game")
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_body_entered(body : Node2D):
	if not body.is_in_group("died"):
		body.add_to_group("died")
		print(body.name + " died!")
		audio_stream_player.play()
		if body is Player:
			timer.start()


func _on_timer_timeout():
	game_manager.restart()
