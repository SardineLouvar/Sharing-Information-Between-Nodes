extends Node


#the recieved information distribution signal
signal end_direction(end:int)

#where information is held in distributor
var last_direction

#gets FSM to find children of
@export var fsm: Node

#gets all children and connects the signal sharer to them
func _ready():
	for child in fsm.get_children():
		if child is Test_State:
			child.information.connect(_on_information)
	
	
#recieves then redistributes information
func _on_information(info):
	last_direction = info
	end_direction.emit(last_direction)
