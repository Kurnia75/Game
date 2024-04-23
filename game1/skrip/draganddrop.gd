extends Node2D

var order
var ordernya
var skor=0

func _ready():
	random_makanan()
func _on_papan2_input_event(viewport, event, shape_idx):
	pass # Replace with function body.

	#if event is InputEventScreenTouch:
		#if event.is_action_pressed():
			#$AnimatedSprite.visible = false
	
	if event is InputEventScreenDrag:
		$papan2.position = event.get_position()

func _on_ksr_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
	if event is InputEventScreenDrag:
		$ksr.position = event.get_position()

func random_makanan():
	randomize()
	
	order = randi()%2
	if order == 1:
		$papantulis.visible = true
		$km.visible = false
		ordernya = "papan2"
	else:
		$papantulis.visible = false
		$km.visible = true
		ordernya = "ksr"

func _on_areakarakter_area_entered(area):
	if area.name == ordernya:
		skor +=1
		$skor.text = "Skor : " + str(skor)
		if ordernya == "papan2":
			$papan2.visible = false
			$ppn.value = 0
			$papan2.position = Vector2(143,726)
		else:
			$ksr.visible = false
			$kursimeja.value = 0
			$ksr.position = Vector2(449,716)
		random_makanan()


func _on_timer_timeout():
	$ppn.value += 5
	if $ppn.value == 100:
		$papan2.visible = true
		$timer.stop()

func _on_papan3_input_event(viewport, event, shape_idx):
	pass # Replace with function body.

	if event is InputEventScreenTouch:
		$timer.start()

func _on_krs2_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
	if event is InputEventScreenTouch:
		$timerkursi.start()


func _on_timerkursi_timeout():
	pass # Replace with function body.
	$kursimeja.value += 5
	if $kursimeja.value == 100:
		$ksr.visible = true
		$timerkursi.stop()









