extends Node2D


func _ready():
	pass 

func _on_Timer_timeout():
	$progres_bar.value += 5
	if $progres_bar.value == 100:
		ganti_scene.ganti_scenenya("res://scene/prolog_kurnia.tscn")
