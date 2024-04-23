extends Node2D

var teks_sekarang = "Selamat Datang "
var no_dialog = 1
var shadow = 1

func _ready():
	load_dialog(teks_sekarang)

func load_dialog(teks_tampil):
	$teks_dialog.text = teks_tampil
	$Tween.interpolate_property(
		$teks_dialog, "percent_visible",0,1,1,
		Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
	)
	$Tween.start()
	


func _on_TouchScreenButton_pressed():
	no_dialog +=1
	if no_dialog == 2:
		teks_sekarang = "Hai Gays"
		tampil_ft()
	elif no_dialog == 3:
		teks_sekarang = "Ayo main"
		tampil_ft()
	elif no_dialog == 4:
		teks_sekarang = "Ini Adalah Ruangan"
		tampil_ruangan()
		sembunyi_ft()
	elif no_dialog == 5:
		teks_sekarang = "Apa saja peralatan yang dibutuhkan didalam ruangan, yang di arahkan oleh kotak tersebut. "
		sembunyi_ruangan()
		tampil_idle()
	elif no_dialog == 6:
		teks_sekarang = "Pilih dan klik gambar apa yang dibutuhkan yang di arahkan oleh kotak tersebut"
		tampil_idle()
		tampil_gambar()
	elif no_dialog == 7 :
		ganti_scene.ganti_scenenya("res://scene/draganddrop.tscn")
		
	load_dialog(teks_sekarang)
	
#untuk cek karakter

	
func tampil_ruangan():
	$ruangan.visible = true
	
func sembunyi_ruangan():
	$ruangan.visible = false
	
func tampil_idle():
	$idle.visible = true
	
func sembunyi_idle():
	$idle.visible = false
	
func tampil_ft():
	$ft.visible = true
	
func sembunyi_ft():
	$ft.visible = false
	
func tampil_gambar():
	$gambar.visible = true
	
func sembunyi_gambar():
	$gambar.visible = false




func _on_Timer_timeout():
	shadow +=1
	if shadow %2 ==1 :
		$shadow.visible = true
	else :
		$shadow.visible = false
