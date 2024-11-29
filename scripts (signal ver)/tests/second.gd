extends Test_State
#recieves but cannot send signal (lack of emitter)

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
		state_transition.emit(self, "Third")
		
func Exit():
	pass
	
