extends Resource
class_name CE_Raycast

#I never got this to work and I don't know why
static func Get_Collision(p_From : Vector3, p_To : Vector3, p_Exceptions : Array = [], p_Mask : int = 2147483647, p_Bodies : bool = true, p_Areas : bool = true) -> Dictionary:
	var _Space_State = CE_Window.get_tree().get_root().get_world().get_direct_space_state()
	return _Space_State.intersect_ray(p_From, p_To, p_Exceptions, p_Mask, p_Bodies, p_Areas)

static func Get_Object(_camera : Camera3D) -> Dictionary:
	var _position = CE_Mouse.Get_Position()
	var _from = _camera.project_ray_origin(_position)
	var _to = _from + _camera.project_ray_normal(_position) * 2147483647
	var _space_state = _camera.get_tree().get_root().get_world().get_direct_space_state()
	return _space_state.intersect_ray(_from, _to, [], 2147483647, false, true)

static func Get_Plane_Collision(_camera : Camera3D, _plane : Plane, _scale : float = 1.0) -> Variant:
	var _position = CE_Mouse.Get_Position() / _scale
	var _from = _camera.project_ray_origin(_position)
	var _to = _from + _camera.project_ray_normal(_position) * 2147483647
	return _plane.intersects_ray(_from, _to)
