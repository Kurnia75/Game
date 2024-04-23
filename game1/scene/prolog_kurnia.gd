extends Node2D

var teks_sekarang = "welcome"
var no_dialog = 1
var no_karakter = 1
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
		teks_sekarang = "hai gays"
	elif no_dialog == 3:
		teks_sekarang = "Lets gooo"
	elif no_dialog == 4:
		teks_sekarang = "ini adalah rumaaahh"
		tampil_gedung()
	elif no_dialog == 5:
		teks_sekarang = "pilih karakter "
		sembunyi_gedung()
		tampil_lakilaki()
		tampil_btn_karakter()
	elif no_dialog == 6:
		ganti_scene.no_karakter = no_karakter
		teks_sekarang = "This is your Character"
		sembunyi_btn_karakter()
		sembunyi_lakilaki()
		sembunyi_perempuan()
		tampil_gedung()
		cek_karakter()
	elif no_dialog == 7 :
		teks_sekarang = "oh noooooo....... something wrong"
		$Timer.start()
	elif no_dialog == 8 :
		$Timer.stop()
		sembunyi_gedung()
		teks_sekarang = "ft missssiiiiiinnnng"
	load_dialog(teks_sekarang)
	
#untuk cek karakter
func cek_karakter():
	if ganti_scene.no_karakter ==1:
		$btn_karakter1.visible = true
	else:
		$btn_karakter2.visible = true
	
	
func tampil_gedung():
	$rumah.visible = true
	
func sembunyi_gedung():
	$rumah.visible = false
	
func tampil_lakilaki():
	$laki2.visible = true
	
func sembunyi_lakilaki():
	$laki2.visible = false
	
func tampil_perempuan():
	$perempuan.visible = true
	
func sembunyi_perempuan():
	$perempuan.visible = false
	
func tampil_btn_karakter():
	$btn_karakter1.visible = true
	$btn_karakter2.visible = true
	
func sembunyi_btn_karakter():
	$btn_karakter1.visible = false
	$btn_karakter2.visible = false

func ganti_karakter ():
	if no_karakter == 1:
		tampil_perempuan()
		sembunyi_lakilaki()
		no_karakter = 2
	else :
		tampil_lakilaki()
		sembunyi_perempuan()
		no_karakter = 1


func _on_btn_karakter1_pressed():
	ganti_karakter()


func _on_btn_karakter2_pressed():
	ganti_karakter()


func _on_Timer_timeout():
	shadow +=1
	if shadow %2 ==1 :
		$shadow.visible = true
	else :
		$shadow.visible = false
