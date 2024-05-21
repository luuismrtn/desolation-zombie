extends HSlider

@export var bus_name: String

var bus_index: int

## The below function initializes the bus index and sets the initial volume
func _ready():
	bus_index = AudioServer.get_bus_index(bus_name)
	value = Global.volume_value
	
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
	
	value_changed.connect(_on_value_changed)

## The below function handles the value_changed signal and updates the volume
func _on_value_changed(volume_value: float) -> void:
	Global.volume_value = volume_value
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(volume_value)
	)
	
	Global.save_info()
