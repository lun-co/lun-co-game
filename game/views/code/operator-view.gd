extends Node


var ray_length = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _input(event):
#	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
#		var from = camera.project_ray_origin(event.position)
#		var to = from + camera.project_ray_normal(event.position) * ray_length
##		print(from, "  ", to)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EmptyMap_clicked(position):
	print("Map clicked: ", position)
	var scene = load("res://content/spacex-starship/source/SpaceX_Starship.fbx")
	var instance = scene.instance()
	
	instance.translation = position
	$Map.add_child(instance)