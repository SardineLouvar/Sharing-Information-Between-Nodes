extends State
#currently a normal state, cannot recieve or send information.

var rand


func Enter():
	print("")
	print(self.name)
	
	#makes variable
	rand = randi_range(0,100)
	print("Generated random number is: ", rand)
	
func Update(_delta:float):
	#switches state when q pressed
	if Input.is_action_just_pressed("action"):
		state_transition.emit(self, "Fourth")


func Exit():
	pass
