extends Node
#@icon("res://Art/Icons/FSMSprite.png")

@export var initial_state : State


#dictionary to hold child states
var states: Dictionary = {}
var current_state : State

#ready is called once when entering the scene tree.
func _ready():
	#checks if there is an initial state
	if initial_state == null:
		print("There is no initial state! Source: " + str(get_parent().name))
	
	#adds child states to dictionary
	#connects the child's "state_transition" signal to the state machine.
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_transition.connect(change_state)
	#print(states.keys())
	
	#Enters the initial state on startup
	if initial_state:
		initial_state.Enter()    
		current_state = initial_state        #initial determination of current state
	
	
#Call the current states update function continuosly
func _physics_process(delta):
	if current_state:
		current_state.Update(delta)

#A separate update function if process needs to be used (FrameUpdate)
func _process(delta):
	if current_state:
		current_state.FrameUpdate(delta)
	

#Use force_change_state cautiously, it immediately switches to a state regardless of any transitions.
func force_change_state(new_state : String):
	var newState = states.get(new_state.to_lower())
	
	if !newState:
		print(new_state + " does not exist in the dictionary of states")
		return
	
	if current_state == newState:
		print("State is same, aborting")
		return
		
	#NOTE Calling exit like so: (current_state.Exit()) may cause warnings when flushing queries, like when the enemy is being removed after death. 
	#call_deferred is safe and prevents this from occuring. We get the Exit function from the state as a callable and then call it in a thread-safe manner
	if current_state:
		var exit_callable = Callable(current_state, "Exit")
		exit_callable.call_deferred()
	
	newState.Enter()
	
	current_state = newState
	
	
func change_state(source_state : State, new_state_name : String):

	#Checks that you aren't trying to change into current state
	if source_state != current_state:
		print("Invalid change_state trying from: " + source_state.name + " but currently in: " + current_state.name)
		return
		
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("New state is empty")
		return
		
	#leaves the current state when changing
	if current_state:
		current_state.Exit()
	
	#enters the new state
	new_state.Enter()
	
	#sets the new state as current state
	current_state = new_state
	
