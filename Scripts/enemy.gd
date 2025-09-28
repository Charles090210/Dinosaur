extends Area2D
@export var speed= 200
@onready var player = get_tree().get_first_node_in_group("player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		var dir = player.global_position - global_position
		if dir.length() > 0:
			dir = dir.normalized()
			global_position += dir * speed * delta


func _on_area_entered(area: Area2D) -> void:
	self.queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body == player:
		print("touched")
		get_tree().reload_current_scene()
