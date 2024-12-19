extends CanvasLayer

@onready var states: StateMachine = $"../States"
@onready var paused_panel: ColorRect = $paused_panel

func _ready() -> void:
	Pause.paused.connect(_paused)
	Pause.resumed.connect(_resumed)
	
func _paused():
	paused_panel.visible = true;
	pass;
func _resumed():
	paused_panel.visible = false;
	pass;
