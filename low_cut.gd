extends Marker3D

@export var bus_index:int = 0
@export var effect_index:int = 1

var effect:AudioEffectLowPassFilter

func _ready() -> void:
	effect = AudioServer.get_bus_effect(bus_index, effect_index)
	pass

func _process(delta: float) -> void:
	effect.cutoff_hz = $grab.value	
	pass	
