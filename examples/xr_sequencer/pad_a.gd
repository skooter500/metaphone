extends Area3D

var toggle:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# mat = StandardMaterial3D.new()
	# $MeshInstance3D.set_surface_override_material(0, mat)
	# mat.albedo_color = out_color
	# mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

		
func _on_area_entered(area: Area3D) -> void:
	toggle = ! toggle
	pass # Replace with function body.
