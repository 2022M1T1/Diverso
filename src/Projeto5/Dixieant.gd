extends Area2D
var active = false

func _ready():
	connect("body_entered", self, '_on_Dixie_body_entered')
	connect("body_exited", self, '_on_Dixie_body_exited')

func _on_Dixie_body_entered(body):
	if body.name == "Jogador" and Globalpos.npc4 and Globalpos.star:
		active = true

func _on_Dixie_body_exited(body):
	if body.name == "Jogador":
		active = false

func _process(delta): 
	$Pointda.visible=active
	if Globalpos.npc4==false or Globalpos.star==false:
		$estrelaant.visible = false
	elif Globalpos.npc4 and Globalpos.star:
		$estrelaant.visible = true

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and Globalpos.npc4 and Globalpos.star and active:
			get_tree().paused = true
			var dialog = Dialogic.start('Dixiea')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
			Transition.fade_into("res://Scene/Antonio/QuizAntonio/QuizAntonio4.tscn")

func unpause(timeline_timeline1):
	get_tree().paused = false
