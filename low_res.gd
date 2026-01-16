extends Marker3D

@export var bus_index:int = 0
@export var effect_index:int = 2

var effect:AudioEffectFilter

func _ready() -> void:
	effect = AudioServer.get_bus_effect(bus_index, effect_index)
	$grab.set_value(effect.resonance)
	pass

func _process(delta: float) -> void:
	effect.resonance = $grab.value	
	pass	
