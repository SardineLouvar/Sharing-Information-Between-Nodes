extends State               #inherits State, customised for player
class_name Test_State

signal information(info)

@export var signal_distributor: Node


#for signal sharer
#################################################################
func _ready():
	#connects all states to signal sharer
	signal_distributor.end_direction.connect(sharer_reciever)

#function that plays in all states when signal recieved
func sharer_reciever(end):
	print("Signal to " + self.name + " recieved! " + str(end))
	
##################################################################
