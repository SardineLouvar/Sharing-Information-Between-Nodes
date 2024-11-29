# Sharing-Information-Between-Nodes
The following Godot 4.3 program demonstrates multiple approaches to sharing information between nodes (given in different scenes), using either signals or resources. The signal method is primarily proof of concept, and I would recommend attempting the resource method first if you would like to share information between nodes.

A primary example of a need to distribute information across multiple nodes is if your player has a state machine. You likely want to keep track of the direction that the player was facing before switching states, and the previous state, which is easy to do with these methods.


#### Run one of the scenes, then press either space or left mouse click to test the code. The results should show in the console.

## Signals method (trial_state_signal_bus.tscn):

The signals method makes use of a "signal sharer" node, which receives an "information" signal, then distributes it to all nodes that inherit the "test state". This method allows you to make sure that all information is provided (since signals have set numbers of inputs), and information can be easily modified and checked before distributing, all in one place. However, this method is slightly more confusing than the resources method, and requires some more code.

To implement the code:
1. Ensure that there is a signal sharer node attached to the primary node, and it has the correct script.
2. Make sure that the ready function is connecting signals from the right sources (in my example I'm connecting from all child nodes of "FSM" that inherit from "test state", change this to fit your use).
3. Ensure that any nodes that must receive the information inherit from "test state" (if using a state machine), or include all of the code provided within.
4. Make sure that all export variables are correctly allocated just like in the example.

## Resources method (resource_distribution.tscn):

This is a simpler method that does a similar job, and also, due to the nature of resources, allows you to save the information permanently if necessary.

To implement the code:
1. Create a custom resource by inheriting a script from Resource, and filling it with export variables of your desired information.
2. Create a resource from the script. This resource will contain information that can be shared between nodes.
3. Create a class (like receiver_class) to indicate that the node is receiving information, or otherwise make sure that the receivers contain an export for the resource.
4. Now you can access the information with RESOURCE_NAME.value.
