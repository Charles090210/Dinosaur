extends Node

@export var enemy_tscn: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spone_enemy():
	print("Enemy Spawned")
	var new_enemy = enemy_tscn.instantiate()
	add_sibling(new_enemy)
	
	var viewport_width=get_viewport_rect().size.x
	new_enemy.position.x=randf_range(20,viewport_width)
	new_enemy.position.y= -50
