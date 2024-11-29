extends RecieverClass

var randint : int

#generates random numbers that are instantly shared
func _process(delta):
	randint = randi_range(0,100)
	TRANSFER_RESOURCE.information = randint

#displays random number shared
func _input(event):
	if Input.is_action_just_pressed("action"):
		print("random number is ", randint)
