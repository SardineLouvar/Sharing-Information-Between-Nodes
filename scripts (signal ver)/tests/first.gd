extends Test_State
#sends and recieves signal

var rand


func Enter():
	print("")
	print(self.name)
	
	#makes variable to send 
	rand = randi_range(0,100)
	print("Generated random number is: ", rand)
	
func Update(_delta:float):
	#switches state when q pressed
	if Input.is_action_just_pressed("action"):
		state_transition.emit(self, "Second")

func Exit():
	#emits information to signal sharer
	information.emit(rand)
