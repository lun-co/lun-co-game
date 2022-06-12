#This code is based on Gogot kinematic_character example
class_name Operator
extends KinematicBody

export (NodePath) var target

export var MAX_SPEED = 100
export var JUMP_SPEED = 2
export var ACCELERATION = 50
export var DECELERATION = 50

onready var camera = get_node(target)

onready var gravity = 0
onready var start_position = translation

var velocity: Vector3
var dir = Vector3()

# Commands
# reset_position
# move(direction)

func _input(_event):
		
	
	dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	dir.z = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")	
	dir.y = Input.get_action_strength("move_up") - Input.get_action_strength("move_down")	
	
		
func _physics_process(delta):
	
	# Get the camera's transform basis, but remove the X rotation such
	# that the Y axis is up and Z is horizontal.
	var cam_basis = camera.global_transform.basis
	var basis = cam_basis.rotated(cam_basis.x, -cam_basis.get_euler().x)
#	dir = basis.xform(dir)
	dir = dir.normalized()

	# Apply gravity.
	velocity.y += delta * gravity

	# Using only the horizontal velocity, interpolate towards the input.
	var hvel = velocity
	hvel.y = 0

	var target_dir = dir * MAX_SPEED
	var acceleration
	if dir.dot(hvel) > 0:
		acceleration = ACCELERATION
	else:
		acceleration = DECELERATION

	hvel = hvel.linear_interpolate(target_dir, acceleration * delta)

	# Assign hvel's values back to velocity, and then move.
	velocity.x = hvel.x
	velocity.z = hvel.z
	velocity.y = hvel.y
	velocity = move_and_slide(velocity, Vector3.UP)

	
#-----------

func reset_position():
	translation = start_position
