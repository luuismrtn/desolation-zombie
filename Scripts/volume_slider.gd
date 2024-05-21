extends HSlider

@export var bus_name: String

var bus_index: int

func _ready():
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	
	value = 1
	
func _on_value_changed(volumen_value: float) -> void:
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(volumen_value)
	)
