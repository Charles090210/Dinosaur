extends Node

@export var enemy_tscn: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	print("Enemy Spawned")
	var new_enemy = enemy_tscn.instantiate()
	add_sibling(new_enemy)
	
	var spawn_side = randi() % 2
	if spawn_side == 0:
		new_enemy.position.x = 0
	else:
		new_enemy.position.x=1200
	new_enemy.position.y=randi_range(600,740)
