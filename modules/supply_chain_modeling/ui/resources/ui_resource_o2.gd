extends UIBaseResource

func _init():
	super._init()
	if not resource:
		resource = ResourceO2.new("O2")
	

