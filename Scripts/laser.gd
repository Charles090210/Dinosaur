extends Area2D

@export var speed= 200
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x+=speed*delta


func _on_area_entered(area: Area2D) -> void:
	self.queue_free()
