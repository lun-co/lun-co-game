extends UIBaseResource

func _init():
	super._init()
	if not resource:
		resource = ResourceH2.new("H2")
