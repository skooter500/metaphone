extends Marker3D
@export var bus_index:int = 0
@export var effect_index:int = 1
@export var min_freq:float = 20.0  # Start at sub-bass
@export var max_freq:float = 12000.0  # Go higher for high pass
@export var curve_power:float = 2.5  # Gentler curve for high pass
@export var resonance:float = 2.0  # Add some emphasis at cutoff

var effect:AudioEffectFilter

func _ready() -> void:
	effect = AudioServer.get_bus_effect(bus_index, effect_index)
	
	# Set resonance for more audible sweeping
	# effect.resonance = resonance
	
	# Clamp the current frequency to valid range first
	var current_freq = clamp(effect.cutoff_hz, min_freq, max_freq)
	
	# Reverse map current frequency to find initial grab value
	var normalized = inverse_lerp(min_freq, max_freq, current_freq)
	var val = pow(normalized, 1.0/curve_power)
	
	$grab.set_value(val)

func _process(delta: float) -> void:
	# Apply exponential curve to the linear input
	var normalized_value = clamp($grab.value, 0.0, 1.0)
	var curved_value = pow(normalized_value, curve_power)
	
	# Map to frequency range
	effect.cutoff_hz = lerp(min_freq, max_freq, curved_value)
