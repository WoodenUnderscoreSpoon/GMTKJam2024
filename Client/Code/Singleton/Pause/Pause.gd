extends Node
class_name s_Pause

static func Pause_Tree(_node : Node, _pause : bool):
	Pause_Node(_node, _pause)
	for _child in _node.get_children(): Pause_Tree(_child, _pause)

static func Pause_Node(_node : Node, _pause : bool) -> void:
	_node.set_process(!_pause)
	_node.set_process_input(!_pause)
	_node.set_physics_process(!_pause)
	_node.set_process_internal(!_pause)
	_node.set_process_unhandled_input(!_pause)
	_node.set_process_unhandled_key_input(!_pause)
	if (_node.has_method("_pause")): _node.call("_pause", _pause)
