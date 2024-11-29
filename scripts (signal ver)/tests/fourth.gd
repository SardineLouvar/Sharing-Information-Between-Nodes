extends State
#custom version, can send but not recieve information.

var rand

#parts required for connecting and sending signal
#######################################################################
signal information(info)
@onready var signal_sharer = %Signal_sharer

#connects fourth to the signal player manually
func _ready():
	information.connect(signal_sharer._on_information)
#########################################################################


func Enter():
	print("")
	print(self.name)
	
	#makes variable to send
	rand = randi_range(0,100)
	print("Generated random number is: ", rand)
	
	
func Update(_delta:float):
	#switches state when q pressed
	if Input.is_action_just_pressed("action"):
		state_transition.emit(self, "First")


func Exit():
	#emits information to signal sharer
	information.emit(rand)
