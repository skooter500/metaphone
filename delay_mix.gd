extends Marker3D

@export var bus_index:int = 0
@export var effect_index:int = 1
var effect:AudioEffect

func _ready() -> void:
	effect = AudioServer.get_bus_effect(bus_index, effect_index)
	effect.tap1_active = true
	effect.tap1_delay_ms = 250.0  # Quarter note at 120 BPM
	effect.tap1_level_db = -6
	effect.feedback_active = true
	effect.feedback_delay_ms = 250.0
	effect.feedback_level_db = -6  # Crank for dub-style repeats
	effect.dry = 0
	set_delay_amount(0)

# Fade delay in/out by adjusting tap volumes
func set_delay_amount(value: float):  # 0.0 to 1.0
	var db = lerp(-60, -6, value)  # -60db = silent, -6db = loud
	effect.tap1_level_db = db
	effect.tap2_level_db = db  # if using multiple taps
	effect.feedback_level_db = db - 6  # Keep feedback quieter

func _process(delta: float) -> void:
	set_delay_amount($grab.value)
