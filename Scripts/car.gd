extends VehicleBody3D


const MaxSteer = 0.8
const MaxSpeed = 300
@onready var cameraPivot = $CameraPivot
@onready var camera3D = $CameraPivot/Camera3D

var lookAt

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	lookAt = global_position

func _physics_process(delta):
	steering = move_toward(steering,Input.get_axis("ui_right", "ui_left") * MaxSteer, delta * 2.5)
	engine_force = Input.get_axis("ui_down", "ui_up") * MaxSpeed
	cameraPivot.global_position = cameraPivot.global_position.lerp(global_position, delta * 20)
	cameraPivot.transform = cameraPivot.transform.interpolate_with(transform, delta * 5.0)
	lookAt = lookAt.lerp(global_position + linear_velocity, delta * 5.0)
	camera3D.look_at(lookAt)
