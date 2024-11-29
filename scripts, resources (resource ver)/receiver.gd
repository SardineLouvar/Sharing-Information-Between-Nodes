extends RecieverClass

#Goes on A, B. Used to demonstrate that information is received
func _input(event):
	if Input.is_action_just_pressed("action"):
		print(TRANSFER_RESOURCE.information, " recieved at ", self.name)
