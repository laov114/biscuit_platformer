extends Node
class_name GameManager

@onready var bgm_player: AudioStreamPlayer = %BGMPlayer
@onready var pause_label: Label = %PauseLabel
@onready var map: Node2D = $Map
@onready var player: Player = $Map/Player
const MAP = preload("res://scenes/map.tscn")

func _ready() -> void:
	Global.score = 0
	#player_setup()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mute"):
		bgm_player.stream_paused = !bgm_player.stream_paused
		var bus = AudioServer.get_bus_index("Master")
		AudioServer.set_bus_mute(bus, !AudioServer.is_bus_mute(bus))
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		pause_label.visible = get_tree().paused


#func player_setup():
	#var spawn : Marker2D = map.get_node("Spawn")
	#player.position = spawn.position
	##player.set_physics_process(true)
	#player.get_node("Camera2D").reset_smoothing()
	#player.remove_from_group("died")


func restart():
	#player.set_physics_process(false)
	Global.score = 0
	map.queue_free()
	map = MAP.instantiate()
	add_child(map)
	#player_setup()
