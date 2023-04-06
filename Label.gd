extends Label

var ms = 00
var s = 00
var m = 00

func _process (_delta) :
	
	if ms > 9 :
		s += 1
		ms = 0
		
	if s > 59 :
		m += 1
		s = 0
	
	set_text(str( m )+ " : " +str(s) + " : " +str(ms))

pass

func _on_Timer_timeout():
	ms += 1

	if m >= 3:
		get_tree().paused = true
		get_parent().get_node("tempoacabou").text = "O tempo acabou!"

