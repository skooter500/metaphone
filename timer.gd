extends Timer


func _on_timeout() -> void:
	print("note")

	var m = InputEventMIDI.new()
	m.message = MIDI_MESSAGE_NOTE_ON
	m.pitch = 100
	m.velocity = 100
	m.channel = 1
	
	
	$"../instruments/MidiPlayer".receive_raw_midi_message(m)
	
	pass # Replace with function body.
