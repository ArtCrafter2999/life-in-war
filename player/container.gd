@tool
extends Container

var children: Array[Node]:
	get:
		return find_children("*", "Control", false, true);

func _ready() -> void:
	for index in children.size():
		var child = children[index] as Control;
		var mod = (ceil(index/2) * 20 * (1 if index % 2 == 0 else -1))
		print(mod)
		child.position.x = (size.x / 2) + mod
		#child.rotation += 0.1;
