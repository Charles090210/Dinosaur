extends Area2D

@export var speed= 800
var direction: Vector2 = Vector2.RIGHT
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_area_entered(area: Area2D) -> void:
	self.queue_free()
