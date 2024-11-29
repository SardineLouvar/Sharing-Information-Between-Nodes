extends State               #inherits State, customised for player
class_name Signal_State

signal information(info)

@export var distributor: Node

var last_direction : Vector2
var movement_actions := ["left","right","up","down"] #group for movement inputs
var direction : Vector2
var last_state : String

	
#for signal sharer
#################################################################
func _ready():
	#connects all states to signal sharer
	distributor.end_direction.connect(sharer_reciever)
	direction = Vector2(0,0)

#function that plays in all states when signal recieved
#sets the recieved information as variable useable in state
func sharer_reciever(direction:Vector2,state:String):
	last_direction = direction
	last_state = state.to_lower()
	#print("Signal to " + self.name + " recieved! " + str(last_direction))
	#print("last state was " + last_state)
##################################################################
