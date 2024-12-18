extends Node

@onready var curious: Node = $Curious
@onready var frightened: Node = $Frightened
@onready var happy: Node = $Happy
@onready var cautious: Node = $Cautious

@export var mood: Creature.Mood:
	set(new):
		mood = new
		
		reset()
		if mood == Creature.Mood.CURIOUS:
			curious.set_process_mode(Node.PROCESS_MODE_PAUSABLE)
		elif mood == Creature.Mood.FRIGHTENED:
			frightened.set_process_mode(Node.PROCESS_MODE_PAUSABLE)
		elif mood == Creature.Mood.HAPPY:
			happy.set_process_mode(Node.PROCESS_MODE_PAUSABLE)
		else:
			cautious.set_process_mode(Node.PROCESS_MODE_PAUSABLE)


func reset():
	curious.set_process_mode(Node.PROCESS_MODE_DISABLED)
	frightened.set_process_mode(Node.PROCESS_MODE_DISABLED)
	happy.set_process_mode(Node.PROCESS_MODE_DISABLED)
	cautious.set_process_mode(Node.PROCESS_MODE_DISABLED)
