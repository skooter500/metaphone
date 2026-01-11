extends Area3D

var inside = false
func _ready() -> void:	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

		
func _on_area_entered(area: Area3D) -> void:
	inside = true
	pass # Replace with function body.


func _on_area_exited(area: Area3D) -> void:
	inside = true
	pass # Replace with function body.
