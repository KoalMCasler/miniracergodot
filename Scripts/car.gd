extends VehicleBody3D


const MaxSteer = 0.8
const MaxSpeed = 300

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	steering = move_toward(steering,Input.get_axis("ui_right", "ui_left") * MaxSteer, delta * 2.5)
	engine_force = Input.get_axis("ui_down", "ui_up") * MaxSpeed
