extends Node
#class_name CE_Delete

var _Nodes : Array[Node] = []

func _physics_process(_delta : float) -> void:
	if (!_Nodes.is_empty()):
		var _back = _Nodes.back()
		var _node = _back
		while (_node.get_child_count() > 0): _node = _node.get_child(0)
		if (_back == _node): _Nodes.pop_back()
		_node.queue_free()

func Add(_node : Node) -> void:
	pass
	#_node.queue_free()
	_Nodes.append(_node)
