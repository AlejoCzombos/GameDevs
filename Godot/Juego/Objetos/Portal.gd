extends Area2D

var esta_activo = false
export var proximoNivel = ""

func _ready():
# warning-ignore:return_value_discarded
	get_parent().connect("abrirPortal", self, "playAnimacion")

func _on_body_entered(body):
	if esta_activo == true:
		body.playEntrarPortal(global_position)
		yield(get_tree().create_timer(1.2), "timeout")
		cambiarNivel()

func cambiarNivel():
# warning-ignore:return_value_discarded
	get_tree().change_scene(proximoNivel)

func playAnimacion():
	esta_activo = true
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("Activado")
